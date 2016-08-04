//
//  Factory.h
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoPlayerViewController.h"

@interface Factory : NSObject

+ (void)playVideo:(NSURL *)videoURL;

+ (void)addBackItemToVC:(UIViewController *)vc;

// 右上角添加搜索按钮
+ (void) addSearchItemToVC:(UIViewController *)vc clickHandler:(void(^)())clickHandler;

// 获取缓存的数据大小
+ (NSString *)getCacheSize;
// 删除缓存数据
+ (void)removeCacheData;

@end
