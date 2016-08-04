//
//  ColumnCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "ColumnCell.h"

@implementation ColumnCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self gameNameLb];
    }
    return self;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            // 449 / 344
//            make.height.equalTo(_imageView.width).multipliedBy(449 / 344.0);
            make.height.equalTo((kWindowW - 10 * 4) / 3);
            make.bottom.equalTo(self.gameNameLb.mas_top);
        }];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}
- (UIView *)smallView{
    if (!_smallView) {
        _smallView = [UIView new];
        [self addSubview:_smallView];
        [_smallView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(2);
        }];
        _smallView.backgroundColor = [UIColor redColor];
    }
    return _smallView;
}
- (UILabel *)gameNameLb{
    if (!_gameNameLb) {
        _gameNameLb = [UILabel new];
        [self addSubview:_gameNameLb];
        [_gameNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom);
            make.left.right.equalTo(0);
            make.bottom.equalTo(self.smallView.mas_top);
            make.height.equalTo(29);
        }];
        _gameNameLb.textAlignment = NSTextAlignmentCenter;
    }
    return _gameNameLb;
}
@end
