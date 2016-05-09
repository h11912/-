//
//  GLZhuceView.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/2.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLZhuceView.h"
#import "UITabBarItem+Item.h"
#import "GLTextField.h"
#import <MBProgressHUD.h>
#import "SendRequest.h"
#import "CommonUtils.h"
#import "GLQuerenXingxiView.h"
@interface GLZhuceView ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *nextbtn;
@property (weak, nonatomic) IBOutlet UIButton *xieBtn;
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet GLTextField *yzmText;
@property (weak, nonatomic) IBOutlet GLTextField *mimaText;
@property (nonatomic,strong) UIButton *getWordBtn;
@property (weak, nonatomic) IBOutlet GLTextField *sjhaoText;
@end

@implementation GLZhuceView
{
    bool phone;
    bool pwd;
    bool yzm;
}
//协议书
- (IBAction)yonghuxieyi:(id)sender {
    
}


static int countDown = 59;

- (IBAction)xieBtnClick:(UIButton *)sender {
    self.xieBtn.selected = !self.xieBtn.selected;
    
    if (phone && pwd && yzm && self.xieBtn.selected) {
        [self.nextbtn setBackgroundColor:UIColorFromRGB(0xfd6523)];
        [self.nextbtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        self.nextbtn.userInteractionEnabled = YES;
    }else{
        [self.nextbtn setBackgroundColor:UIColorFromRGB(0xcdcdcd)];
        [self.nextbtn setTitleColor:UIColorFromRGB(0x7f7f7f) forState:UIControlStateNormal];
        self.nextbtn.userInteractionEnabled = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];


    phone = NO;
    pwd = NO;
    yzm = NO;

    self.nextbtn.userInteractionEnabled = NO;
    [self.nextbtn setBackgroundColor:[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1]];
    self.nextbtn.layer.cornerRadius = 3;
    [self.xieBtn setImage:[UIImage imageNamed:@"协议框"] forState:UIControlStateNormal];
    [self.xieBtn setImage:[UIImage imageNamed:@"协议框勾选"] forState:UIControlStateSelected ];
    self.sjhaoText.delegate = self;
    self.mimaText.delegate = self;
    self.yzmText.delegate = self;
    
    self.getWordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.getWordBtn.frame = CGRectMake(kWidth(320) - 90, 10, 75, 25);
    [self.getWordBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.getWordBtn.backgroundColor = UIColorFromRGB(0xcdcdcd);
    self.getWordBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.getWordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.getWordBtn.layer.cornerRadius = 3;
    [self.getWordBtn addTarget:self action:@selector(getWordClick) forControlEvents:UIControlEventTouchUpInside ];
    self.getWordBtn.userInteractionEnabled = NO;
    [self.phoneView addSubview:self.getWordBtn];
    [self setUpNavgationBar];
    // Do any additional setup after loading the view from its nib.
}
- (void)getWordClick{
     [self showProgressWithView:self.view animated:YES];
    [SendRequest getCodeWithPhone:self.sjhaoText.text type:@"1" result:^(NSDictionary *data, NSError *error) {
         [self hideProgress:self.view animated:YES];
        if ([[data objectForKey:@"result"] isEqualToString:@"1"]) {
            [[CommonUtils sharedCommonUtils] showAlert:@"验证码已发出，请查收" delegate:nil];
            [self.getWordBtn setBackgroundColor:UIColorFromRGB(0xcdcdcd)];
            [self.getWordBtn setTitleColor:UIColorFromRGB(0x7f7f7f) forState:UIControlStateNormal];
            self.getWordBtn.userInteractionEnabled = NO;
            if (_t) {
                [_t invalidate];
                _t = nil;
            }
            _t = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
        }else if ([[data objectForKey:@"result"] isEqualToString:@"0"]){
            self.getWordBtn.userInteractionEnabled = YES;
            NSString *str = [data objectForKey:@"msg"];
            [[CommonUtils sharedCommonUtils] showAlert:str delegate:nil];
        }
        
    }];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.sjhaoText) {
        if (range.length == 0 && range.location > 10) {
            return NO;
        }
        if ([self.getWordBtn.titleLabel.text isEqualToString:@"获取验证码"]) {
            if (range.length == 0 && range.location == 10) {
                [self.getWordBtn setBackgroundColor:UIColorFromRGB(0xfd6523)];
                [self.getWordBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
                self.getWordBtn.userInteractionEnabled = YES;
                phone = YES;
            }else{
                [self.getWordBtn setBackgroundColor:UIColorFromRGB(0xcdcdcd)];
                [self.getWordBtn setTitleColor:UIColorFromRGB(0x7f7f7f) forState:UIControlStateNormal];
                self.getWordBtn.userInteractionEnabled = NO;
                phone = NO;
            }
        }
    }else if (textField == self.yzmText){
        if (range.length == 0 && range.location > 3) {
            return NO;
        }
        if (range.length == 0 && range.location == 3) {
            yzm = YES;
        }else{yzm = NO;}
    }else if (textField == self.mimaText){
        if (range.length == 0 && range.location > 17) {
            return NO;
        }
        if ((range.length == 0 && range.location >= 5) || (range.length == 1 && range.location >= 6)) {
            pwd = YES;
        }else{
            pwd = NO;
        }
    }
 
    return YES;
  
}



- (void)countTime{
     NSLog(@"%s",__func__);
    NSString *strcountDown = [NSString stringWithFormat:@"重新发送(%d)",countDown--];
    [self.getWordBtn setTitle:strcountDown forState:UIControlStateNormal];
    self.getWordBtn.backgroundColor = UIColorFromRGB(0xcdcdcd);
    self.getWordBtn.userInteractionEnabled = NO;
    if (countDown == -1) {
        countDown = 59;
        [_t invalidate];
        [self.getWordBtn setBackgroundColor:UIColorFromRGB(0xfd6523)];
        [self.getWordBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        self.getWordBtn.userInteractionEnabled = YES;
        [self.getWordBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    }
}
- (IBAction)nextBtnClick:(id)sender {
    GLQuerenXingxiView *queVc = [[GLQuerenXingxiView alloc] init];
    [self.navigationController pushViewController:queVc animated:YES];
//    [self showProgressWithView:self.view animated:YES];
//   [SendRequest registWithPhone:self.sjhaoText.text Code:self.yzmText.text pwd:self.mimaText.text result:^(NSDictionary *data, NSError *error) {
//     [self hideProgress:self.view animated:YES];
//     if ([[data objectForKey:@"result"] isEqualToString:@"1"]) {
//         GLQuerenXingxiView *queVc = [[GLQuerenXingxiView alloc] init];
//         queVc.strUid = [[data objectForKey:@"data"] objectForKey:@"uid"];
//         [self.navigationController pushViewController:queVc animated:YES];
//     }else if ([[data objectForKey:@"result"] isEqualToString:@"0"]){
//         NSString *str = [data objectForKey:@"msg"];
//         UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//         [alt show];
//       
//     }
// }];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)setUpNavgationBar
{
    self.navigationItem.title = @"注册";
}

- (void)backToPre
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
