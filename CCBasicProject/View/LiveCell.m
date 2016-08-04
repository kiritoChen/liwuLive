//
//  LiveCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LiveCell.h"
#define kWidth ((kWindowW - 3 * 10) /  2)
@implementation LiveCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}
// 最上层view
- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        [self addSubview:_topView];
        CGFloat width = (kWindowW - 3 * 10) /  2;
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
//            make.width.equalTo(width);
            make.height.equalTo(width).multipliedBy(220 / 390.0);
        }];
        _topView.layer.cornerRadius = 3;
        _topView.layer.masksToBounds = YES;
    }
    return _topView;
}
// 最下层view
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [UIView new];
        [self addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom).equalTo(0);
            make.height.equalTo(50);
            make.left.right.bottom.equalTo(0);
        }];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}


- (UIImageView *)thumbImageView{
    // 390 * 220
    if (!_thumbImageView) {
        _thumbImageView = [UIImageView new];
        [self.topView addSubview:_thumbImageView];
        [_thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _thumbImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _thumbImageView;
}

// 中间最小的人数view
- (UIView *)littleView{
    if (!_littleView) {
        _littleView = [UIView new];
        [self.thumbImageView addSubview:_littleView];
        [_littleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(3);
            make.bottom.equalTo(-3);
            make.height.equalTo(15);
//            make.size.equalTo(CGSizeMake(45, 15));
        }];
        _littleView.layer.cornerRadius = 2;
        _littleView.layer.masksToBounds = YES;
        _littleView.backgroundColor = kRGBA(0, 0, 0, 0.5);
    }
    return _littleView;
}
- (UIImageView *)playImageView{
    if (!_playImageView) {
        _playImageView = [UIImageView new];
        [self.littleView addSubview:_playImageView];
        [_playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(2);
            make.size.equalTo(CGSizeMake(10, 10));
            make.centerY.equalTo(0);
        }];
        _playImageView.image = [UIImage imageNamed:@"ic_content_slt_playnumber"];
    }
    return _playImageView;
}
- (UILabel *)viewsLb{
    if (!_viewsLb) {
        _viewsLb = [UILabel new];
        [self.littleView addSubview:_viewsLb];
        [_viewsLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.playImageView.mas_right).equalTo(1);;
            make.centerY.equalTo(0);
            make.right.equalTo(-2);
            
        }];
        _viewsLb.textColor = [UIColor whiteColor];
        _viewsLb.font = [UIFont systemFontOfSize:8];
    }
    return _viewsLb;
}



- (UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        _avatarImageView = [UIImageView new];
        [self.bottomView addSubview:_avatarImageView];
        [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.size.equalTo(CGSizeMake(30, 30));
            make.centerY.equalTo(0);
        }];
        _avatarImageView.layer.cornerRadius = 15;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarImageView;
}
- (UILabel *)nickLb{
    if (!_nickLb) {
        _nickLb = [UILabel new];
        [self.bottomView addSubview:_nickLb];
        [_nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarImageView.mas_right).equalTo(5);
            make.top.equalTo(8);
            make.height.equalTo(20);
            make.right.equalTo(-10);
        }];
        _nickLb.text = @"百度发US发送的方法";
        _nickLb.font = [UIFont systemFontOfSize:14];
    }
    return _nickLb;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.bottomView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarImageView.mas_right).equalTo(5);
            make.top.equalTo(self.nickLb.mas_bottom).equalTo(3);
            make.right.equalTo(-10);
//            make.bottom.equalTo(self.avatarImageView.mas_bottom);
        }];
        _titleLb.text = @"英雄联盟都已大撒旦法安抚都是阿发对方是撒旦法";
        _titleLb.font = [UIFont systemFontOfSize:10];
        _titleLb.textColor = [UIColor grayColor];
    }
    return _titleLb;
}

@end
























