//
//  HomePageViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HomePageViewModel.h"

@implementation HomePageViewModel
- (id)init{
    if (self = [super init]) {
        _recommentStartIndex = 0;
    }
    return self;
}
/* 列表---begain--- */
- (NSInteger)listNum{
    return self.allList.count;
}
//- (HomePageListModel *)pageListModelForRow:(NSInteger)row{
//    
//}
/* 列表---end--- */

/* 头部广告视图---begain--- */
- (NSInteger)indexNum{
    return self.mobileIndexList.count;
}
- (NSURL *)indexIconForIndex:(NSInteger)index{
    return [self modelForIndex:index].linkObject.thumb.cc_URL;
}
- (HomePageMobileModel *)modelForIndex:(NSInteger)index{
    return self.mobileIndexList[index];
}
- (NSString *)titleForIndex:(NSInteger)index{
    return [self modelForIndex:index].linkObject.title;
}
- (NSURL *)indexURLForIndex:(NSInteger)index{
    NSString *path = [NSString stringWithFormat:kPlayPath, [self modelForIndex:index].linkObject.uid];
    return [NSURL URLWithString:path];
}
/* 头部广告视图---end--- */

/* 主播---begain--- */
- (NSInteger)starsNum{
    return self.starsList.count;
}
- (NSURL *)starIconForIndex:(NSInteger)index{
    return [self starModelForIndex:index].thumb.cc_URL;
}
- (NSString *)starTitleForIndex:(NSInteger)index{
    return [self starModelForIndex:index].title;
}
- (HomePageMobileModel *)starModelForIndex:(NSInteger)index{
    return self.starsList[index];
}
/* 主播---end--- */

/* 推荐---begain--- */
- (NSInteger)recommendNum{
//    return self.recommendList.count;
    if (self.currentRecommendList.count < 2) {
        return _currentRecommendList.count;
    }
    return 2;
}
- (HomePageMobileModel *)recommendModelForRow:(NSInteger)row{
    return self.currentRecommendList[row];
}
- (NSURL *)recommendURLForRow:(NSInteger)row{
    return [self recommendModelForRow:row].linkObject.thumb.cc_URL;
}
- (NSURL *)recommendAvartForRow:(NSInteger)row{
    return [self recommendModelForRow:row].linkObject.avatar.cc_URL;
}
- (NSString *)recommendViewsForRow:(NSInteger)row{
    double num = [self recommendModelForRow:row].linkObject.view.doubleValue;
    if (num > 10000) {
        return [NSString stringWithFormat:@"%.1f万", num / 10000.0];
    }
    return [NSString stringWithFormat:@"%.f", num];
}
- (NSString *)recommendNickForRow:(NSInteger)row{
    return [self recommendModelForRow:row].linkObject.nick;
}
- (NSString *)recommendTitleForRow:(NSInteger)row{
    return [self recommendModelForRow:row].linkObject.title;
}
- (NSURL *)recommendVideoForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:kPlayPath, [self recommendModelForRow:row].linkObject.uid];
    return path.cc_URL;
}
- (NSArray *)currentRecommendList{
    if (_currentRecommendList.count == 0 && self.recommendList.count > 0) {
        [self changeCurrentRecommentList];
    }
    return _currentRecommendList;
}
- (void)changeCurrentRecommentList{
    if (self.recommendList.count > 0) {
        NSMutableArray *tmpArr = [NSMutableArray new];
        [tmpArr addObject:[self getNextRecommend]];
        [tmpArr addObject:[self getNextRecommend]];
        self.currentRecommendList = tmpArr;
    }
}
- (HomePageMobileModel *)getNextRecommend{
    if (self.recommendList.count > 0) {
        if (self.recommendList.count - 1 >= _recommentStartIndex) {
            return self.recommendList[_recommentStartIndex++];
        }else {
            _recommentStartIndex = 1;
            return self.recommendList.firstObject;
        }
    }
    return nil;
}
/* 推荐---end--- */

/* 其他---begain--- */
- (NSInteger)linkNumber{
    return self.linkList.count;
}
- (HomePageLinkObjectModel *)linkModelForIndexPath:(NSIndexPath *)indexPath{
    NSArray *tmpArr = self.linkList[indexPath.section];
    HomePageMobileLinkModel * model = tmpArr[indexPath.row];
    return model.linkObject;
}
- (NSInteger)linkNumberForSection:(NSInteger)section{
    NSArray *tmpMobileLinks = self.linkList[section];
    return tmpMobileLinks.count;
}
- (NSURL *)linkIconURLForIndexPath:(NSIndexPath *)indexPath{
    return [self linkModelForIndexPath:indexPath].thumb.cc_URL;
}
- (NSString *)linkTitleForIndexPath:(NSIndexPath *)indexPath{
    return [self linkModelForIndexPath:indexPath].title;
}
- (NSString *)linkNickForIndexPath:(NSIndexPath *)indexPath{
    return [self linkModelForIndexPath:indexPath].nick;
}
- (NSString *)linkViewForIndexPath:(NSIndexPath *)indexPath{
    double viewNum = [self linkModelForIndexPath:indexPath].view.doubleValue;
    if (viewNum >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", viewNum / 10000.0];
    }
    return [NSString stringWithFormat:@"%.f", viewNum];
}
- (NSURL *)linkAvatarForIndexPath:(NSIndexPath *)indexPath{
    return [self linkModelForIndexPath:indexPath].avatar.cc_URL;
}
- (NSString *)linkCategoryNameForIndexPath:(NSIndexPath *)indexPath{
    return [self linkModelForIndexPath:indexPath].categoryName;
}
- (NSString *)linkSlugForIndexPath:(NSIndexPath *)indexPath{
    return [self linkModelForIndexPath:indexPath].categorySlug;
}
- (NSURL *)linkVideoForIndexPath:(NSIndexPath *)indexPath{
    NSString *path = [NSString stringWithFormat:kPlayPath, [self linkModelForIndexPath:indexPath].uid];
    return path.cc_URL;
}

/* 其他---end--- */
- (void)getDataCompletionHandler:(void (^)(NSError *))completionHandler{
    [NetManager getHomePageDateCompletionHandler:^(HomePageModel *model, NSError *error) {
        if (!error) {
            self.mobileIndexList = model.mobileIndex;
            self.starsList = model.mobileStar;
            self.recommendList = model.mobileRecommendation;
            self.allList = model.list;
            /*所有类型是TRIntroMobileLinkModel类型的, 样式一致
             通过runtime获取属性, 查看属性数组中的元素是什么类型
             */
            unsigned int outCount = 0;
            Ivar *varList = class_copyIvarList([model class], &outCount);
            NSMutableArray *tmpList = [NSMutableArray new];
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = varList[i];
                const char *name = ivar_getName(ivar);
                NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
                id obj = [model valueForKey:propertyName];
                if ([obj isKindOfClass:[NSArray class]]) {
                    id firstObj = [(NSArray *)obj firstObject];
                    if ([firstObj isKindOfClass:[HomePageMobileLinkModel class]]) {
                        [tmpList addObject:obj];
                    }
                }
            }
            self.linkList = tmpList;
        }
        !completionHandler ?: completionHandler(error);
    }];
}


@end

















