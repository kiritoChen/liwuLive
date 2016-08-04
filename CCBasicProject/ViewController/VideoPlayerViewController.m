//
//  VideoPlayerViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "VideoPlayerViewController.h"

@interface VideoPlayerViewController ()

@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.player.currentItem addObserver:self forKeyPath:@"playbackBufferEmpty" options:NSKeyValueObservingOptionNew context:playbackContext];
    [self.player.currentItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:playbackContext];
}

- (void)dealloc{
    [self.player.currentItem removeObserver:self forKeyPath:@"playbackBufferEmpty" context:playbackContext];
    [self.player.currentItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp" context:playbackContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


static void *playbackContext = &playbackContext;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    // 如果视频出现暂停的情况就把当前的播放暂停，然后重新播放.
    if (context == playbackContext) {
        [self.player pause];
        [self.player play];
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}


@end
