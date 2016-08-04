//
//  DetailViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
#import "BasicViewModel.h"

@interface DetailViewModel : BasicViewModel
@property (nonatomic) NSInteger numForCell;
- (NSURL *)thumbImageForRow:(NSInteger)row;
- (NSString *)viewsForRow:(NSInteger)row;
// 头像
- (NSURL *)avatarImageForRow:(NSInteger)row;
// 主播名字
- (NSString *)nickForRow:(NSInteger)row;
// 详情介绍
- (NSString *)titleForRow:(NSInteger)row;
// 视频播放地址
- (NSURL *)uidForRow:(NSInteger)row;

- (DetailDataModel *)modelForRow:(NSInteger)row;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray<DetailDataModel *> *dataList;
// 判断是否还有数据
@property (nonatomic, readonly) BOOL isMoreData;
- (void)getDataRequestModel:(VMRequestModel)requestModel gameType:(NSString *)gameType completionHandler:(void (^)(NSError *error))completionHandler;

@end
