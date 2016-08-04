//
//  DetailViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName;
// 接收游戏名字
@property (nonatomic) NSString *gameName;
@property (nonatomic) NSString *gameSlug;
@end
