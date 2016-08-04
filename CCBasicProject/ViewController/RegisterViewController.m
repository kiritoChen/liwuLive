//
//  RegisterViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/20.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
// 手机号
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;
// 验证码
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTF;
// 昵称
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
// 密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *getVerifilCodeBtn;
@property (nonatomic) NSString *phoneNumberBmob;// 防止获取验证码之后被更改
@end

@implementation RegisterViewController
// 注册
- (IBAction)registerButton:(id)sender {
    BmobUser *user = [[BmobUser alloc] init];
    user.mobilePhoneNumber = _phoneNumberBmob;
    user.password = _passwordTF.text;
    [user setObject:_userNameTF.text forKey:@"nickName"];
    if (_userNameTF.text.length != 0 && _passwordTF.text.length >= 8) {
        
    
    [user signUpOrLoginInbackgroundWithSMSCode:_verificationCodeTF.text block:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            BmobUser *user = [BmobUser getCurrentUser];
            NSLog(@"%@", user);
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"注册成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [alertC addAction:action];
            [self presentViewController:alertC animated:YES completion:nil];
            
        }else {
            NSLog(@"%@", error);
        }
    }];
        
    }
}

// 获取验证码
- (IBAction)getVerificationCode:(id)sender {
    if (_phoneNumberTF.text.length == 11) {
        
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:_phoneNumberTF.text andTemplate:@"test" resultBlock:^(int number, NSError *error) {
        if (error) {
            DDLogError(@"%@", error);
        }else {
            NSLog(@"sms ID: %d", number);
            _phoneNumberBmob = _phoneNumberTF.text;
            // 获取到验证码
            __block NSInteger duration = 59;
            _getVerifilCodeBtn.enabled = NO;
            [_getVerifilCodeBtn setTitle:@"60s后再获取" forState:UIControlStateNormal];
            [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
                NSString *title = [NSString stringWithFormat:@"%lds后再获取", duration--];
                [_getVerifilCodeBtn setTitle:title forState:UIControlStateNormal];
                if (duration == 0) {
                    [timer invalidate];
                    _getVerifilCodeBtn.enabled = YES;
                    [_getVerifilCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                }
            } repeats:YES];
        }
    }];
    }else {
        [self.view showWarning:@"手机号码不正确"];
    }
}
static int num = 1;
// 显示密码
- (IBAction)showPassword:(UIButton *)sender {
    if (num % 2 == 0) {
        [_passwordTF setSecureTextEntry:NO];
        num ++;
    }else {
        [_passwordTF setSecureTextEntry:YES];
        num ++;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
