//
//  UIView+HUD.m
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "UIView+HUD.h"
//超时
#define kTimeOut  30
//弹出提示时长
#define kDuration  1
static NSMutableArray *imageList = nil;

@implementation UIView (HUD)
- (void)showBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        // 自定义繁忙视图
        hud.mode = MBProgressHUDModeCustomView;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSArray *imageNames = @[@"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11"];
            imageList = [NSMutableArray new];
            for (int i = 0; i < imageNames.count; i++) {
                [imageList addObject:[UIImage imageNamed:imageNames[i]]];
            }
        });
        imageView.animationImages = imageList;
        imageView.animationDuration = 1.0;
        [imageView startAnimating];
        hud.customView = imageView;
        hud.color = [UIColor clearColor];
        [hud hide:YES afterDelay:kTimeOut];
    });
}
- (void)showWarning:(NSString *)warning{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = warning;
        [hud hide:YES afterDelay:kDuration];
    });
}
- (void)hideBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}
@end
