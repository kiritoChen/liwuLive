//
//  ColumnViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "ColumnViewController.h"
#import "ColumnCell.h"
#import "ColumnViewModel.h"
#import "DetailViewController.h"

@interface ColumnViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
/** <#属性声明#> */
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *layout;

@property (nonatomic) ColumnViewModel *columnVM;
@end

@implementation ColumnViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"栏目";
        self.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_lanmu_normal"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_lanmu_selected"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.columnVM getDataCompletionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error");
            }else {
                [self.collectionView reloadData];
            }
            [self.collectionView.mj_header endRefreshing];
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <#代理#> Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.columnVM.numForRow;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.gameNameLb.text = [self.columnVM nameForRow:indexPath.row];
    [cell.imageView sd_setImageWithURL:[self.columnVM imageURLForRow:indexPath.row]];
    
    return cell;
}
// 跳转下一页
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.hidesBottomBarWhenPushed = YES;// 隐藏标签栏
    DetailViewController *detailVC = [DetailViewController new];
    detailVC.gameSlug = [self.columnVM slugForRow:indexPath.row];
    detailVC.gameName = [self.columnVM gameNameForRow:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;// 隐藏标签栏
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
        [_collectionView registerClass:[ColumnCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
	if(_layout == nil) {
		_layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kWindowW - 4 * 10) / 3;
        // 296*416
        CGFloat height = width * 449 / 344 + 30;
        _layout.itemSize = CGSizeMake(width, height);
	}
	return _layout;
}

- (ColumnViewModel *)columnVM {
	if(_columnVM == nil) {
		_columnVM = [[ColumnViewModel alloc] init];
	}
	return _columnVM;
}

@end
