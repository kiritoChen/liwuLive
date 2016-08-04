//
//  LeftViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/19.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;

@end

@implementation LeftViewController
// 意见反馈
- (IBAction)feedBack:(id)sender {
}
//设置
- (IBAction)setSystem:(id)sender {
}
// 点我登录
- (IBAction)loginBtn:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.tableFooterView = [UIView new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
