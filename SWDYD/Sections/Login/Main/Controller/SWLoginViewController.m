//
//  SWLoginViewController.m
//  SWDYD
//
//  Created by zijin on 2018/9/27.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWLoginViewController.h"

@interface SWLoginViewController ()
/** 账号输入 */
@property (nonatomic, strong) UITextField *phoneTF;
/** 密码输入 */
@property (nonatomic, strong) UITextField *pswTF;
@end

@implementation SWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setup];
}

#pragma mark -- 登录
- (void)loginAction {
    [self.view endEditing:YES];
    
    if (![_phoneTF.text sw_validPhoneNum]) {
        [SWProgressHUD sw_showTip:@"手机号不对啦"];
        return;
    }
    if (_pswTF.text.length == 0) {
        [SWProgressHUD sw_showTip:@"密码还没填哦"];
        return;
    }
    
    [[SWClient shareClient] sw_loginWithPhone:_phoneTF.text password:_pswTF.text];
}

- (void)setup {
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.image = [UIImage imageNamed:@"login_activity_bgNew"];
    [self.view addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
    UIImageView *logo = [[UIImageView alloc]init];
    logo.image = [UIImage imageNamed:@"login_decoration_220x98_"];
    [self.view addSubview:logo];
    
    UIView *container = [[UIView alloc]init];
    container.backgroundColor = [UIColor whiteColor];
    container.layer.cornerRadius = 10.0f;
    container.clipsToBounds = YES;
    [self.view addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.width.equalTo(@285);
        make.height.equalTo(@135);
        make.top.equalTo(@215);
    }];
    
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(container.mas_top).offset(15);
    }];
    
    UIView *separator = [[UIView alloc]init];
    separator.backgroundColor = [UIColor sw_red];
    [container addSubview:separator];
    [separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@(-10));
        make.centerY.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
    
    UIImageView *phoneIcon = [[UIImageView alloc]init];
    phoneIcon.image = [UIImage imageNamed:@"login_input_number_25x25_"];
    [container addSubview:phoneIcon];
    [phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@22);
        make.width.height.equalTo(@25);
        make.top.equalTo(@21);
    }];
    
    UIImageView *pswIcon = [[UIImageView alloc]init];
    pswIcon.image = [UIImage imageNamed:@"login_input_password_25x25_"];
    [container addSubview:pswIcon];
    [pswIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@22);
        make.width.height.equalTo(@25);
        make.top.equalTo(separator.mas_bottom).offset(21);
    }];
    
    [container addSubview:self.phoneTF];
    self.phoneTF.placeholder = @"我的手机号";
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneIcon.mas_right).offset(15);
        make.right.equalTo(@(-22));
        make.top.height.equalTo(phoneIcon);
    }];
    
    [container addSubview:self.pswTF];
    self.pswTF.placeholder = @"我的密码";
    [self.pswTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pswIcon.mas_right).offset(15);
        make.right.equalTo(@(-22));
        make.top.height.equalTo(pswIcon);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor sw_red:253 green:191 blue:45];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 20;
    loginBtn.clipsToBounds = YES;
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(container);
        make.top.equalTo(container.mas_bottom).offset(20);
        make.height.equalTo(@40);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (UITextField *)phoneTF {
    if (!_phoneTF) {
        _phoneTF = [[UITextField alloc]init];
        _phoneTF.textAlignment = NSTextAlignmentLeft;
        _phoneTF.font = SWFont(16);
        _phoneTF.textColor = [UIColor sw_gray];
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _phoneTF;
}

- (UITextField *)pswTF {
    if (!_pswTF) {
        _pswTF = [[UITextField alloc]init];
        _pswTF.textAlignment = NSTextAlignmentLeft;
        _pswTF.font = SWFont(16);
        _pswTF.textColor = [UIColor sw_gray];
        _pswTF.keyboardType = UIKeyboardTypeASCIICapable;
        _pswTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pswTF.secureTextEntry = YES;
    }
    return _pswTF;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
