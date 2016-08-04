//
//  HomeIndexCell.h
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeIndexCell : UICollectionViewCell

#define kIndexIcAdTag 1000
#define kIndexIcStarTag 1001
// 头部滚动视图
@property (nonatomic) iCarousel *icAd;
// 头部头像滚动视图
@property (nonatomic) iCarousel *icStars;

@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UIView *grayView;
@property (nonatomic) UILabel *introLb;

@property (nonatomic) id<iCarouselDelegate, iCarouselDataSource> icDelegate;

@end
