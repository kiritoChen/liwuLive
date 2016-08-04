//
//  LiveCell.h
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveCell : UICollectionViewCell
@property (nonatomic) UIView *topView;
@property (nonatomic) UIImageView *thumbImageView;

@property (nonatomic) UIView *littleView;
@property (nonatomic) UIImageView *playImageView;
@property (nonatomic) UILabel *viewsLb;

@property (nonatomic) UIView *bottomView;
@property (nonatomic) UIImageView *avatarImageView;
@property (nonatomic) UILabel *nickLb;
@property (nonatomic) UILabel *titleLb;

@end
