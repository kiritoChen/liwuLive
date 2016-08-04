//
//  NetManager.h
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveModel.h"
#import "DetailModel.h"
#import "ColumnModel.h"
#import "HomePageModel.h"
#import "SearchModel.h"

@interface NetManager : NSObject
+ (void)getLiveDataPage:(NSInteger)page completionHandler:(void(^)(LiveModel *liveModel, NSError *error))completionHandler;

// 栏目
+ (void)getColumnDataCompletionHandler:(void(^)(id columnModel, NSError *error))completionHandler;
// 栏目详情
+ (void)getDetailDataGameType:(NSString *)gameType page:(NSInteger)page completionHandler:(void(^)(DetailModel *detailModel, NSError *error))completionHandler;
// 首页
+ (void)getHomePageDateCompletionHandler:(void(^)(HomePageModel *model, NSError *error))completionHandler;

// 搜索
+ (id)search:(NSString *)words page:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler;


@end
