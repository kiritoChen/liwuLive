//
//  NetManager.m
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
// 获取直播页面数据
+ (void)getLiveDataPage:(NSInteger)page completionHandler:(void (^)(LiveModel *, NSError *))completionHandler{
    NSString *str = @"";
    if (page) {
        str = [NSString stringWithFormat:@"_%ld", page];
    }
    NSString *path = [NSString stringWithFormat:kLivePath, str];
    NSLog(@"%@", path);
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([LiveModel parseJSON:jsonObj], error);
    }];
}

// 栏目
+ (void)getColumnDataCompletionHandler:(void (^)(id, NSError *))completionHandler{
    [self GET:kColumnPath parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([ColumnModel parseJSON:jsonObj], error);
    }];
}

// 栏目详情
+ (void)getDetailDataGameType:(NSString *)gameType page:(NSInteger)page completionHandler:(void(^)(DetailModel *detailModel, NSError *error))completionHandler{
    NSString *str = @"";
    if (page) {
        str = [NSString stringWithFormat:@"_%ld", page];
    }
    NSString *path = [NSString stringWithFormat:kDetailPath, gameType, str];
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([DetailModel parseJSON:jsonObj], error);
    }];
}
// 首页
+ (void)getHomePageDateCompletionHandler:(void (^)(HomePageModel *, NSError *))completionHandler{
    [self GET:kHomePagePath parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([HomePageModel parseJSON:jsonObj], error);
    }];
}

// 搜索
+ (id)search:(NSString *)words page:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"site.search" forKey:@"m"];
    [params setObject:@"2" forKey:@"os"];
    [params setObject:@"0" forKey:@"p[categoryId]"];
    [params setObject:words forKey:@"p[key]"];
    [params setObject:@(page) forKey:@"p[page]"];
    [params setObject:@"10" forKey:@"p[size]"];
    [params setObject:@"1.3.2" forKey:@"v"];
    return [self POST:kSearchPath parameters:params downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        completionHandler([SearchModel parseJSON:jsonObj], error);
    }];
}

@end













