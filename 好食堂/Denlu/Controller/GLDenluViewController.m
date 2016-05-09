//
//  GLDenluViewController.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/2.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLDenluViewController.h"
#import "GLZhuceView.h"
#import "GLNavigationController.h"
#import "GLFogetPwdController.h"

@interface GLDenluViewController ()
@property (weak, nonatomic) IBOutlet UIView *icon;

@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIView *mima;
@property (weak, nonatomic) IBOutlet UIView *mimaview;
@property (weak, nonatomic) IBOutlet UIView *login;

@end



@implementation GLDenluViewController
- (IBAction)loginClick:(id)sender {
    
    
    
}

- (IBAction)zhuCeClick:(id)sender {
    GLZhuceView *zhuce = [[GLZhuceView alloc] init];
    GLNavigationController *nav = [[GLNavigationController alloc] initWithRootViewController:zhuce];
    [self presentViewController:nav animated:nil completion:nil];
}

- (IBAction)fogetPwd:(id)sender {
    GLFogetPwdController *foget = [[GLFogetPwdController alloc] init];
    GLNavigationController *nav = [[GLNavigationController alloc] initWithRootViewController:foget];
    [self presentViewController:nav animated:NO completion:nil];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self textWithView:self.textView withImageView:self.icon withimageName:@"手机号"];
    [self textWithView:self.mimaview withImageView:self.mima withimageName:@"密码"];
    self.login.layer.cornerRadius = 5;
    self.login.layer.borderColor = kWhiteColor.CGColor;
    self.login.layer.borderWidth = 1;

}


- (void)textWithView:(UIView *) textview withImageView:(UIView *)imageview withimageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageview.frame];
    imageView.image = [UIImage imageNamed:imageName];
    [imageview addSubview:imageView];
    textview.layer.cornerRadius = 5;
    textview.layer.borderWidth = 1;
    textview.layer.borderColor = kWhiteColor.CGColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
