//
//  ViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/6/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** <#属性声明#> */
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
	}
	return _collectionView;
}



@end
