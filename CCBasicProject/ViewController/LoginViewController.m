//
//  LoginViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/20.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [Factory addBackItemToVC:self];
    
    UIBarButtonItem *regBtn = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerClick:)];
    self.navigationItem.rightBarButtonItem = regBtn;
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    btn.layer.cornerRadius = 18;
    btn.layer.masksToBounds = YES;
    [btn setImage:[UIImage imageNamed:@"btn_nav_log_close"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backMenu:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backMenuBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backMenuBtn;
    
}

- (void)registerClick:sender{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegisterViewController *regiVC = [sb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController:regiVC animated:YES];
}
- (void)backMenu:sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
