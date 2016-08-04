//
//  SetViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/20.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchControl;// 控制WiFi开关
@property (weak, nonatomic) IBOutlet UILabel *cacheLb; // 缓存大小

@end

@implementation SetViewController
// 页面出现的时候刷新缓存数据
- (void)viewWillAppear:(BOOL)animated{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.cacheLb.text = [Factory getCacheSize];
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //返回侧边栏按钮
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:[UIImage imageNamed:@"返回-默认"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backMenu:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backMenuBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backMenuBtn;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 1) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"清除缓存" message:@"是否确定 要清除缓存数据" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 方法事件
            [Factory removeCacheData];
            self.cacheLb.text = [Factory getCacheSize];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
            
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:sureAction];
        [alertVC addAction:cancelAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}


#pragma mark - Method
// 返回按钮触发事件
- (void)backMenu:sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)switchWiFi:(UISwitch *)sender {
    
    
}



@end

















