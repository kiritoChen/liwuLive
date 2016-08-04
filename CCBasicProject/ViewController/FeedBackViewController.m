//
//  FeedBackViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/20.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FeedBackViewController
// 提交反馈按钮
- (IBAction)submitBtn:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:[UIImage imageNamed:@"返回-默认"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backMenu:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backMenuBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backMenuBtn;
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
