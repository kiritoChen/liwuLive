//
//  Factory.m
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "Factory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Factory

+ (void)playVideo:(NSURL *)videoURL{
    VideoPlayerViewController *vc = [VideoPlayerViewController new];
    AVPlayerItem *playItem = [AVPlayerItem playerItemWithURL:videoURL];
    vc.player = [AVPlayer playerWithPlayerItem:playItem];
    [vc.player play];
    [kAppdelegate.window.rootViewController presentViewController:vc animated:YES completion:nil];
}

+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 44);
    [btn setImage:[UIImage imageNamed:@"btn_nav_hp_player_back_normal"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_nav_hp_player_back_selected"] forState:UIControlStateHighlighted];
    
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    // 把视图的边角变为圆形
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    // 弹簧控件，修复边距
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.leftBarButtonItems = @[spaceItem, backItem];
}

+ (void)addSearchItemToVC:(UIViewController *)vc clickHandler:(void (^)())clickHandler{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 44);
    [btn setImage:[UIImage imageNamed:@"搜索-默认"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"搜索-按下"] forState:UIControlStateHighlighted];
    
    [btn bk_addEventHandler:^(id sender) {
        clickHandler();
    } forControlEvents:UIControlEventTouchUpInside];
    // 把视图的边角变为圆形
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    // 弹簧控件，修复边距
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.rightBarButtonItems = @[spaceItem, backItem];
}

// 获取缓存数据大小
+ (NSString *)getCacheSize{
    // 缓存大小
    long long sumSize = 0;
    // 获取缓存路径
    NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
//    NSLog(@"缓存的路径 filePath %@", cacheFilePath);
    // 创建文件管理对象
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 获取当前缓存路径下的所有子路径
    NSArray *subChildPath = [fileManager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
    // 遍历所有子文件夹
    for (NSString *subPath in subChildPath) {
        // 拼接完整路径
        NSString *path = [cacheFilePath stringByAppendingFormat:@"/%@", subPath];
        // 计算文件大小
        long long fileSize = [[fileManager attributesOfItemAtPath:path error:nil] fileSize];
        // 加到总文件大小
        sumSize += fileSize;
    }
    float size_m = sumSize / (1024 * 1024);
    return [NSString stringWithFormat:@"%.2fM", size_m];
}
// 删除缓存数据
+ (void)removeCacheData{
    NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:cacheFilePath error:nil];
    return;
}










@end
























