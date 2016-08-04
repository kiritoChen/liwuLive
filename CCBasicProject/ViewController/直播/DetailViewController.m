//
//  DetailViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DetailViewController.h"
#import "LiveCell.h"
#import "DetailViewModel.h"
@import AVFoundation;
@import AVKit;

@interface DetailViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
/** <#属性声明#> */
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *layout;
// 自定义左上角返回按钮
@property (nonatomic) UIBarButtonItem *leftBtn;
@property (nonatomic) DetailViewModel *detailVM;
@end

@implementation DetailViewController
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName{
    if (self = [super init]) {
        self.gameSlug = slug;
        self.gameName = categoryName;
        self.title = categoryName;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.gameName;
    self.navigationItem.leftBarButtonItem = self.leftBtn;
    /*
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.detailVM getDataRequestModel:VMRequestModelRefresh gameType:self.gameSlug completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error");
            }else {
                [self.collectionView reloadData];
            }
            [self.collectionView.mj_header endRefreshing];
        }];
    }];
    // 脚部刷新
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.detailVM getDataRequestModel:VMRequestModelMore gameType:self.gameSlug completionHandler:^(NSError *error) {
            NSLog(@"进了这个方法");
            if (error) {
                NSLog(@"error");
            }else {
                if (self.detailVM.isMoreData == 0) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.collectionView reloadData];
            }
//            [self.collectionView endFooterRefresh];
        }];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
     */
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.detailVM getDataRequestModel:VMRequestModelRefresh gameType:weakSelf.gameSlug completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView.mj_header endRefreshing];
        }];
    }];
    
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.detailVM getDataRequestModel:VMRequestModelMore gameType:weakSelf.gameSlug completionHandler:^(NSError *error) {
            
            if (weakSelf.detailVM.isMoreData == 0) {
                [weakSelf.collectionView.mj_footer endRefreshingWithNoMoreData];
            }else {
                [weakSelf.collectionView reloadData];
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - <#代理#> Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.detailVM.numForCell;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.thumbImageView sd_setImageWithURL:[self.detailVM thumbImageForRow:indexPath.row]];
    cell.viewsLb.text = [self.detailVM viewsForRow:indexPath.row];
    [cell.avatarImageView sd_setImageWithURL:[self.detailVM avatarImageForRow:indexPath.row]];
    cell.nickLb.text = [self.detailVM nickForRow:indexPath.row];
    cell.titleLb.text = [self.detailVM titleForRow:indexPath.row];
    return cell;
}
// 选择进行跳转
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    NSLog(@"地址：%@",[self.detailVM uidForRow:indexPath.row]);
    playerVC.player = [AVPlayer playerWithURL:[self.detailVM uidForRow:indexPath.row]];
    [playerVC.player play];
    [self presentViewController:playerVC animated:YES completion:nil];
    
}

#pragma mark     - LazyLoad 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
	if(_layout == nil) {
		_layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kWindowW -  3 * 10) / 2;
        CGFloat height = width * 200 / 240;
        _layout.itemSize = CGSizeMake(width, height);
	}
	return _layout;
}

- (DetailViewModel *)detailVM {
	if(_detailVM == nil) {
		_detailVM = [[DetailViewModel alloc] init];
	}
	return _detailVM;
}

- (UIBarButtonItem *)leftBtn {
	if(_leftBtn == nil) {
		_leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_hp_player_back_normal"] style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
	}
	return _leftBtn;
}
- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
