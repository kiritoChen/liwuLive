//
//  HeadView.m
//  CCBasicProject
//
//  Created by chenc on 16/7/16.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *lineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend_categroy_title"]];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(3, 20));
        }];
        
        [self addSubview:self.titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineView.mas_right).equalTo(8);
            make.centerY.equalTo(lineView);
        }];
        
        [self addSubview:self.changeControl];
        [self.changeControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(60, 20));
        }];
        
        [self addSubview:self.moreControl];
        [self.moreControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(60, 20));
        }];
    }
    return self;
}

- (void)setBtnType:(ButtonType)btnType{
    _btnType = btnType;
    self.changeControl.hidden = YES;
    self.moreControl.hidden = YES;
    switch (btnType) {
        case ButtonTypeChange: {
            self.changeControl.hidden = NO;
            break;
        }
        case ButtonTypeMore: {
            self.moreControl.hidden = NO;
            break;
        }
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    [self setBtnType:_btnType];
}


- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
    }
    return _titleLb;
}

- (UIControl *)moreControl{
    if (!_moreControl) {
        _moreControl = [UIControl new];
        [_moreControl bk_addEventHandler:^(id sender) {
            if ([_delegate respondsToSelector:@selector(sectionHeaderView:clickBtnAtIndexPath:)]) {
                [_delegate sectionHeaderView:self clickBtnAtIndexPath:_indexPath];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        UILabel *lab = [UILabel new];
        lab.text = @"更多";
        lab.font = [UIFont systemFontOfSize:13];
        [_moreControl addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-3);
        }];
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_home_content_rignt_cc_selected"]];
        [_moreControl addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(lab.mas_left).equalTo(-3);
        }];
    }
    return _moreControl;
}

- (UIControl *)changeControl{
    if (!_changeControl) {
        _changeControl = [UIControl new];
        [_changeControl bk_addEventHandler:^(id sender) {
            if ([_delegate respondsToSelector:@selector(sectionHeaderView:clickBtnAtIndexPath:)]) {
                [_delegate sectionHeaderView:self clickBtnAtIndexPath:_indexPath];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        UILabel *lab = [UILabel new];
        lab.text = @"换一换";
        lab.font = [UIFont systemFontOfSize:13];
        [_changeControl addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-3);
        }];
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_home_content_rignt_huan_selected"]];
        [_changeControl addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(lab.mas_left).equalTo(-3);
        }];
    }
    return _changeControl;
}


@end










