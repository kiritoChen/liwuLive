//
//  HomeIndexCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HomeIndexCell.h"

@implementation HomeIndexCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor =  [UIColor whiteColor];
        [self.icStars mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(110);
        }];
        [self.icAd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(_icStars.mas_top).equalTo(0);
        }];
        [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            if (_icAd.numberOfItems > 1) {
                [_icAd scrollToItemAtIndex:_icAd.currentItemIndex + 1 animated:YES];
            }
        } repeats:YES];
        // 在最下方添加一条线
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kRGBA(180, 180, 180, 1);
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(1);
            make.bottom.left.right.equalTo(0);
        }];
        
    }
    return self;
}

- (iCarousel *)icAd{
    if (!_icAd) {
        _icAd = [[iCarousel alloc] init];
        _icAd.tag = kIndexIcAdTag;
        [self.contentView addSubview:self.icAd];
        _icAd.pagingEnabled = YES;
        _icAd.scrollSpeed = 1;
        [_icAd addSubview:self.grayView];
        [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _icAd;
}
- (iCarousel *)icStars{
    if (!_icStars) {
        _icStars = [[iCarousel alloc] init];
        _icStars.tag = kIndexIcStarTag;
        [self.contentView addSubview:_icStars];
        _icStars.autoscroll = YES;
    }
    return _icStars;
}
- (UIView *)grayView{
    if (!_grayView) {
        _grayView = [UIView new];
        _grayView.backgroundColor = kRGBA(0, 0, 0, 0.4);
        [_grayView addSubview:self.pc];
        [_grayView addSubview:self.introLb];
        [_introLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(8);
            make.right.equalTo(_pc.mas_left);
        }];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-8);
        }];
        
    }
    return _grayView;
}

- (UILabel *)introLb{
    if (!_introLb) {
        _introLb = [UILabel new];
        _introLb.textColor = [UIColor colorWithWhite:1 alpha:0.7];
        _introLb.text = @"猴哥";
    }
    return _introLb;
}
- (UIPageControl *)pc{
    if (!_pc) {
        _pc = [UIPageControl new];
        _pc.currentPageIndicatorTintColor = kNaviBarBGColor;
        _pc.pageIndicatorTintColor = kRGBA(199, 197, 197, 1);
    }
    return _pc;
}

- (void)setIcDelegate:(id<iCarouselDelegate,iCarouselDataSource>)icDelegate{
    self.icAd.delegate = icDelegate;
    self.icAd.dataSource = icDelegate;
    self.icStars.delegate = icDelegate;
    self.icStars.dataSource = icDelegate;
}







@end
