//
//  SearchViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/18.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "SearchViewController.h"
#import "LiveCell.h"
#import "SearchViewModel.h"
#import "Factory.h"
#define kCellSpace          10
#define kCellNumPerLine     2

@interface SearchViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) SearchViewModel *searchVM;
@property (nonatomic) UICollectionViewFlowLayout *layout;
@end

@implementation SearchViewController
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.searchVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.thumbImageView sd_setImageWithURL:[self.searchVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"img_content_default"]];
    cell.titleLb.text = [self.searchVM titleForRow:indexPath.row];
    cell.nickLb.text = [self.searchVM titleForRow:indexPath.row];
    cell.viewsLb.text = [self.searchVM viewForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [Factory playVideo:[self.searchVM videoURLForRow:indexPath.row]];
}

#pragma mark - Method 
- (void)search{
    [_searchBar resignFirstResponder];
    NSString *words = _searchBar.text;
    if (words.length == 0) {
        [self.view showWarning:@"请输入搜索内容"];
        return;
    }
    self.searchVM.words = words;
    [self.view showBusyHUD];
    [self.searchVM getDataRequestModel:VMRequestModelRefresh completionHandler:^(NSError *error) {
        [self.view hideBusyHUD];
        if (!error) {
            [_collectionView reloadData];
            if (!self.searchVM.isHasMore) {
                [_collectionView endFooterRefreshWithNoMoreData];
            }
        }
    }];
}
#pragma mark - UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self search];
}
#pragma mark - LifeCycle 生命周期
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
        _searchBar = [UISearchBar new];
        self.navigationItem.titleView = _searchBar;
        _searchBar.placeholder = @"请输入关键词搜索";
        _searchBar.delegate = self;
        [Factory addSearchItemToVC:self clickHandler:^{
            [self search];
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [Factory addBackItemToVC:self];
    [self collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark     - LazyLoad 懒加载
- (SearchViewModel *)searchVM {
	if(_searchVM == nil) {
		_searchVM = [[SearchViewModel alloc] init];
	}
	return _searchVM;
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
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        WK(weakSelf);
        [_collectionView addBackFooterRefresh:^{
            [weakSelf.searchVM getDataRequestModel:VMRequestModelMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                    if (weakSelf.searchVM.hasMore) {
                        [weakSelf.collectionView endFooterRefresh];
                    }else{
                        [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                    }
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
            }];
        }];
        [_collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"Cell"];
        // 没有搜索内容的时候空显示
//        UIImageView *iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_noResult_image"]];
//        _collectionView.backgroundView = iconIV;
//        iconIV.contentMode = UIViewContentModeCenter;
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
	if(_layout == nil) {
		_layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = kCellSpace;
        _layout.minimumInteritemSpacing = kCellSpace;
        _layout.sectionInset = UIEdgeInsetsMake(kCellSpace, kCellSpace, kCellSpace, kCellSpace);
        CGFloat width = (kWindowW - 3 * kCellSpace) / kCellNumPerLine;
        CGFloat height = 266 * width  / 350;
        _layout.itemSize = CGSizeMake(width, height);
	}
	return _layout;
}

@end








