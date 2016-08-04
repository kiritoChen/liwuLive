//
//  HomePageViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/15.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HomePageViewController.h"
#import "DetailViewController.h"
#import "LiveCell.h"
#import "HeadView.h"
#import "HomeIndexCell.h"
#import "HomePageViewModel.h"
#import "Factory.h"
#import "SearchViewController.h"

#define kHomeIndexCell @"HomeIndexCell"
#define kBasicCell @"Cell"
#define kLiveCell @"liveCell"
#define kHeaderView @"headerView"

@interface HomePageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, iCarouselDelegate, iCarouselDataSource, HomePageSectionHeaderViewDelegate>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) HomePageViewModel *homePageVM;
// 接收头部滚动视图的介绍
@property (nonatomic) NSMutableArray *tmpIntro;
@end

@implementation HomePageViewController
#pragma mark - HomePageSectionHeaderViewDelegate Delegate
- (void)sectionHeaderView:(HeadView *)headerView clickBtnAtIndexPath:(NSIndexPath *)indexPath{
    switch (headerView.btnType) {
        case ButtonTypeChange: {
            [self.homePageVM changeCurrentRecommentList];
            [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
            break;
        }
        case ButtonTypeMore: {
            NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
            DetailViewController *vc = [[DetailViewController alloc] initWithSlug:[self.homePageVM linkSlugForIndexPath:tmpIndexPath] categoryName:[self.homePageVM linkCategoryNameForIndexPath:tmpIndexPath]];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    }
}
#pragma mark - LifeCycle 生命周期------------------------------------------------------------------
- (instancetype)init{
    if (self = [super init]) {
        self.navigationItem.title = @"推荐";
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [UIImage imageNamed:@"btn_tabbar_home_normal"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"btn_tabbar_home_selected"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *sideMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sideMenuBtn.frame = CGRectMake(0, 0, 35, 35);
//    sideMenuBtn.backgroundColor = [UIColor blackColor];
    [sideMenuBtn setImage:[UIImage imageNamed:@"弹幕-默认"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:sideMenuBtn];
//    leftItem.imageInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
    [sideMenuBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.collectionView beginHeaderRefresh];
    
    
    
    [Factory addSearchItemToVC:self clickHandler:^{
        SearchViewController *vc = [SearchViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}
- (void)click:sender{
    [self.sideMenuViewController presentLeftMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - iCarouselDelegate Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if (carousel.tag == kIndexIcAdTag) {
        return self.homePageVM.indexNum;
    }
    return 5;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if (carousel.tag == kIndexIcAdTag) {
        [Factory playVideo:[self.homePageVM indexURLForIndex:index]];
    }else{
        
    }
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    if (carousel.tag == kIndexIcAdTag) {
        NSInteger index = carousel.currentItemIndex;
        HomeIndexCell *cell = (HomeIndexCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.introLb.text = [self.homePageVM titleForIndex:index];
        cell.pc.currentPage = index;
    }
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (carousel.tag == kIndexIcAdTag) {
        if (!view) {
            view = [[UIView alloc] initWithFrame:carousel.bounds];
            view.clipsToBounds = YES;
            UIImageView *iconIV = [UIImageView new];
            iconIV.contentMode = UIViewContentModeScaleAspectFill;
            [view addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
            iconIV.contentMode = UIViewContentModeScaleAspectFill;
            iconIV.tag = 10000;
        }
        UIImageView *iconIV =(UIImageView *)[view viewWithTag:10000];
        [iconIV sd_setImageWithURL:[self.homePageVM indexIconForIndex:index] placeholderImage:[UIImage imageNamed:@"img_home_banner_bg"]];
        
        return view;
        
    }else {
        if (!view) {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, carousel.bounds.size.height)];
            view.clipsToBounds = YES;
            UILabel *nameLb = [UILabel new];
            [view addSubview:nameLb];
            [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.bottom.equalTo(-6);
            }];
            nameLb.tag = 100;
            UIImageView *iconIV = [UIImageView new];
            [view addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.top.equalTo(10);
                make.size.equalTo(CGSizeMake(56, 56));
            }];
            iconIV.clipsToBounds = YES;
            iconIV.tag = 200;
            iconIV.layer.cornerRadius = 28;
        }
        UILabel *nameLb = (UILabel *)[view viewWithTag:100];
        nameLb.text = [self.homePageVM starTitleForIndex:index];
        UIImageView *iconIV =(UIImageView *)[view viewWithTag:200];
        [iconIV sd_setImageWithURL:[self.homePageVM starIconForIndex:index] placeholderImage:[UIImage imageNamed:@"img_home_banner_bg"]];
        return view;
        
        
    }
    return nil;
}
#pragma mark - UICollectionViewDelegateFlowLayout Delegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section != 0) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return UIEdgeInsetsZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(kWindowW, kWindowW * 416 / 748 + 110);
    }else {
        CGFloat width = (kWindowW - 3 * 10) / 2;
        CGFloat height = width * 220 / 390 + 50;
        return CGSizeMake(width, height);
    }
    return CGSizeZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section != 0) {
        return 10;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section != 0) {
        return 10;
    }
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(kWindowW, 35);
}

#pragma mark - UICollectionViewDelegate Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2 + self.homePageVM.linkNumber;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return [self.homePageVM linkNumberForSection:section - 2];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        [Factory playVideo:[self.homePageVM recommendVideoForRow:indexPath.row]];
    }
    if (indexPath.section > 1) {
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        [Factory playVideo:[self.homePageVM linkVideoForIndexPath:tmpIndexPath]];
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HomeIndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHomeIndexCell forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.icDelegate = self;
        cell.pc.numberOfPages = self.homePageVM.indexNum;
        cell.pc.currentPage = 0;
            cell.introLb.text = [self.homePageVM titleForIndex:indexPath.row];
        [cell.icAd  reloadData];
        [cell.icStars reloadData];
        return cell;
    }
    if (indexPath.section == 1) {
        LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLiveCell forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        [cell.thumbImageView sd_setImageWithURL:[self.homePageVM recommendURLForRow:indexPath.row]];
        cell.viewsLb.text = [self.homePageVM recommendViewsForRow:indexPath.row];
        [cell.avatarImageView sd_setImageWithURL:[self.homePageVM recommendAvartForRow:indexPath.row]];
        cell.nickLb.text = [self.homePageVM recommendNickForRow:indexPath.row];
        cell.titleLb.text = [self.homePageVM recommendTitleForRow:indexPath.row];
        return cell;
    }else {
        LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLiveCell forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        [cell.thumbImageView sd_setImageWithURL:[self.homePageVM linkIconURLForIndexPath:tmpIndexPath]];
        cell.viewsLb.text = [self.homePageVM linkViewForIndexPath:tmpIndexPath];
        [cell.avatarImageView sd_setImageWithURL:[self.homePageVM linkAvatarForIndexPath:tmpIndexPath]];
        cell.nickLb.text = [self.homePageVM linkNickForIndexPath:tmpIndexPath];
        cell.titleLb.text = [self.homePageVM linkTitleForIndexPath:tmpIndexPath];
        return cell;
    }
}
/*--------------组头-------------------*/
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return nil;
    }
    HeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderView forIndexPath:indexPath];
    if (indexPath.section == 1) {
        headerView.btnType = ButtonTypeChange;
        headerView.titleLb.text = @"精彩推荐";
    }
    if (indexPath.section > 1) {
        headerView.btnType = ButtonTypeMore;
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        headerView.titleLb.text = [self.homePageVM linkCategoryNameForIndexPath:tmpIndexPath];
    }
    headerView.indexPath = indexPath;
    headerView.delegate = self;
    headerView.backgroundColor = [UIColor whiteColor];
    return headerView;
}


#pragma mark     - LazyLoad 懒加载
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 注册
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kBasicCell];
        [_collectionView registerClass:[HomeIndexCell class] forCellWithReuseIdentifier:kHomeIndexCell];
        [_collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:kLiveCell];
        [_collectionView registerClass:[HeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderView];
        
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.homePageVM getDataCompletionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.backgroundColor = kRGBA(245, 252, 255, 1);
    }
    return _collectionView;
}

- (HomePageViewModel *)homePageVM {
    if(_homePageVM == nil) {
        _homePageVM = [[HomePageViewModel alloc] init];
    }
    return _homePageVM;
}
@end














