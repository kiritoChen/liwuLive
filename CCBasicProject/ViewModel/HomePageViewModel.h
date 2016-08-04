//
//  HomePageViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicViewModel.h"
#import "NetManager.h"

@interface HomePageViewModel : BasicViewModel
/* 列表---begain--- */
@property (nonatomic) NSInteger listNum;
@property (nonatomic) NSArray *allList;
/* 列表---end--- */

/* 头部广告视图---begain--- */
@property (nonatomic) NSInteger indexNum;
@property (nonatomic) NSArray *mobileIndexList;
- (NSURL *)indexIconForIndex:(NSInteger)index;// 滚动视图的图片
- (NSString *)titleForIndex:(NSInteger)index;// 滚动视图的介绍
- (HomePageMobileModel *)modelForIndex:(NSInteger)index;
- (NSURL *)indexURLForIndex:(NSInteger)index;
/* 头部广告视图---end--- */

/* 主播---begain--- */
@property (nonatomic) NSInteger starsNum;
@property (nonatomic) NSArray *starsList;
- (NSURL *)starIconForIndex:(NSInteger)index;
- (NSString *)starTitleForIndex:(NSInteger)index;
- (HomePageMobileModel *)starModelForIndex:(NSInteger)index;
/* 主播---end--- */

/* 推荐---begain--- */
@property (nonatomic) NSInteger recommendNum;
@property (nonatomic) NSArray *recommendList;
@property (nonatomic) NSArray *currentRecommendList;
- (HomePageMobileModel *)recommendModelForRow:(NSInteger)row;
- (NSURL *)recommendURLForRow:(NSInteger)row;
- (NSURL *)recommendAvartForRow:(NSInteger)row;
- (NSString *)recommendViewsForRow:(NSInteger)row;
- (NSString *)recommendNickForRow:(NSInteger)row;
- (NSString *)recommendTitleForRow:(NSInteger)row;
- (NSURL *)recommendVideoForRow:(NSInteger)row;
// 当前数据其实索引值
@property (nonatomic) NSInteger recommentStartIndex;
- (void)changeCurrentRecommentList;
/* 推荐---end--- */

/* 其他---begain--- */
@property (nonatomic) NSInteger linkNumber;
@property (nonatomic) NSArray *linkList;
- (HomePageLinkObjectModel *)linkModelForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)linkNumberForSection:(NSInteger)section;
- (NSURL *)linkIconURLForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkTitleForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkNickForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkViewForIndexPath:(NSIndexPath *)indexPath;
- (NSURL *)linkAvatarForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkCategoryNameForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkSlugForIndexPath:(NSIndexPath *)indexPath;
- (NSURL *)linkVideoForIndexPath:(NSIndexPath *)indexPath;
/* 其他---end--- */

@end






























