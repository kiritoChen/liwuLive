//
//  LiveViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/14.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveCell.h"
#import "LiveViewModel.h"

@import AVFoundation;
@import AVKit;

@interface LiveViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
/** <#属性声明#> */
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *layout;

@property (nonatomic) LiveViewModel *liveVM;
@end

@implementation LiveViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"直播";
        self.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_zhibo_normal"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_zhibo_selected"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 头部刷新
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.liveVM getDataRequestModel:VMRequestModelRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error");
            }else{
                [self.collectionView reloadData];
            }
            [self.collectionView.mj_header endRefreshing];
        }];
    }];
    
    // 脚部刷新
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.liveVM getDataRequestModel:VMRequestModelMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error");
            }else{
                if (self.liveVM.isMoreData) {
                    [self.collectionView reloadData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            [self.collectionView endFooterRefresh];
        }];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIcollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.liveVM.numForCell;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.thumbImageView sd_setImageWithURL:[self.liveVM thumbImageForRow:indexPath.row]];
    cell.viewsLb.text = [self.liveVM viewsForRow:indexPath.row];
    [cell.avatarImageView sd_setImageWithURL:[self.liveVM avatarImageForRow:indexPath.row]];
    cell.nickLb.text = [self.liveVM nickForRow:indexPath.row];
    cell.titleLb.text = [self.liveVM titleForRow:indexPath.row];
    
    return cell;
}
// 选择cell之后进行跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    playerVC.player = [AVPlayer playerWithURL:[self.liveVM uidForRow:indexPath.row]];
    [playerVC.player play];
    [self presentViewController:playerVC animated:YES completion:nil];
}


#pragma mark     - LazyLoad 懒加载
- (UICollectionViewFlowLayout *)layout {
    if(_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumInteritemSpacing = 10;
        _layout.minimumLineSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kWindowW -  3 * 10) / 2;
        CGFloat height = width * 200 / 240;
        _layout.itemSize = CGSizeMake(width, height);
    }
    return _layout;
}

- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _collectionView;
}

- (LiveViewModel *)liveVM {
	if(_liveVM == nil) {
		_liveVM = [[LiveViewModel alloc] init];
	}
	return _liveVM;
}

@end
