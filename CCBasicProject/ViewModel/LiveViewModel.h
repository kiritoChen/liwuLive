//
//  LiveViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
#import "BasicViewModel.h"

@interface LiveViewModel : BasicViewModel
// UI
@property (nonatomic) NSInteger numForCell;
- (NSURL *)thumbImageForRow:(NSInteger)row;
- (NSString *)viewsForRow:(NSInteger)row;
- (NSURL *)avatarImageForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
// 视频播放地址
- (NSURL *)uidForRow:(NSInteger)row;

- (LiveDataModel *)modelForRow:(NSInteger)row;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic) NSMutableArray<LiveDataModel *> *dataList;
// 判断是否还有数据
@property (nonatomic, readonly) BOOL isMoreData;
@end
