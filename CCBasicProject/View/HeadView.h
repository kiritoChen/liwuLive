//
//  HeadView.h
//  CCBasicProject
//
//  Created by chenc on 16/7/16.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeadView;
@protocol HomePageSectionHeaderViewDelegate <NSObject>
/* 头部右侧按钮被点击触发*/
- (void)sectionHeaderView:(HeadView *)headerView clickBtnAtIndexPath:(NSIndexPath *)indexPath;
@end

typedef NS_ENUM(NSUInteger, ButtonType) {
    ButtonTypeChange,
    ButtonTypeMore,
};

@interface HeadView : UICollectionReusableView
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic) ButtonType btnType;
@property (nonatomic) id<HomePageSectionHeaderViewDelegate> delegate;
// 换一换功能
// 更多功能
@property (nonatomic) UIControl *changeControl;
@property (nonatomic) UIControl *moreControl;

@end
