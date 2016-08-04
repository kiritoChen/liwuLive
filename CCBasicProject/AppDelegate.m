//
//  AppDelegate.m
//  CCBasicProject
//
//  Created by chenc on 16/6/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "AppDelegate.h"
#import "LiveViewController.h"
#import "ColumnViewController.h"
#import "HomePageViewController.h"
#import "LeftViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self addCustomGlobalConfig];

    // 接入Bmob后端云
    [Bmob registerWithAppKey:@"c4645b83cd5e401f6316e84f0acf15a5"];
    
    UINavigationController *na1 = [[UINavigationController alloc] initWithRootViewController:[LiveViewController new]];
    UINavigationController *na2 = [[UINavigationController alloc] initWithRootViewController:[ColumnViewController new]];
    UINavigationController *na3 = [[UINavigationController alloc] initWithRootViewController:[HomePageViewController new]];
    // 通过 appearance 方法,可以统一设置某个类型的表现形式.(让N个导航栏变成黑色风格、不透明).
    [UINavigationBar appearance].barTintColor = kNaviBarBGColor;
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].translucent = NO;
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[na3, na2, na1];
    [UITabBar appearance].translucent = NO;
    [UITabBar appearance].itemSpacing = 2;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LeftViewController *leftVC = [sb instantiateViewControllerWithIdentifier:@"LeftViewController"];
    
    RESideMenu *sideMenu = [[RESideMenu alloc] initWithContentViewController:tabBar leftMenuViewController:leftVC rightMenuViewController:nil];
    sideMenu.scaleContentView = NO;
    sideMenu.bouncesHorizontally = NO;
    sideMenu.contentViewInPortraitOffsetCenterX = kWindowW / 2.0 - 80;
    
    _window.rootViewController = sideMenu;
    
    return YES;
}




@end
