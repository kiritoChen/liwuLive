//
//  DetailViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel

- (NSInteger)numForCell{
    return self.dataList.count;
}
- (NSURL *)thumbImageForRow:(NSInteger)row{
    return [self modelForRow:row].thumb.cc_URL;
}
- (NSString *)viewsForRow:(NSInteger)row{
    double num =[self modelForRow:row].view.doubleValue;
    if (num >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", num / 10000.0];
    }
    return @(num).stringValue;
}
- (NSURL *)avatarImageForRow:(NSInteger)row{
    return [self modelForRow:row].avatar.cc_URL;
}
- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)uidForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:kPlayPath, [self modelForRow:row].uid];
    return path.cc_URL;
}

- (DetailDataModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

- (void)getDataRequestModel:(VMRequestModel)requestModel gameType:(NSString *)gameType completionHandler:(void (^)(NSError *error))completionHandler{
    NSInteger tmpPage = 0;
    if (requestModel == VMRequestModelMore) {
        tmpPage = self.page + 1;
    }else {
        tmpPage = 0;
        
    }
    [NetManager getDetailDataGameType:gameType page:tmpPage completionHandler:^(DetailModel *detailModel, NSError *error) {
        if (requestModel == VMRequestModelRefresh) {
            [self.dataList removeAllObjects];
        }
        [self.dataList addObjectsFromArray:detailModel.data];
        _isMoreData = detailModel.data.count < 90 ? NO : YES;
        NSLog(@"%@更多数据", _isMoreData ? @"有": @"没有");
        self.page = tmpPage;
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSMutableArray<DetailDataModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

@end
