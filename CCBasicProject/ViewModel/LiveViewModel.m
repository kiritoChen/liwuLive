//
//  LiveViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LiveViewModel.h"

@implementation LiveViewModel

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
- (LiveDataModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

- (void)getDataRequestModel:(VMRequestModel)requestModel completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    if (requestModel == VMRequestModelRefresh) {
        [self.dataList removeAllObjects];
        tmpPage = 0;
    }else {
        tmpPage = self.page + 1;
    }
    [NetManager getLiveDataPage:tmpPage completionHandler:^(LiveModel *liveModel, NSError *error) {
        [self.dataList addObjectsFromArray:liveModel.data];
        NSLog(@"可变数组的元素个数%ld", self.dataList.count);
        _isMoreData = liveModel.data.count < 90 ? NO : YES;
        self.page = tmpPage;
        !completionHandler ?: completionHandler(error);
    }];

}

- (NSMutableArray<LiveDataModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}












@end
