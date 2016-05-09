//
//  GLFogetPwdController.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/2.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLFogetPwdController.h"
#import "UITabBarItem+Item.h"
@interface GLFogetPwdController ()
@property (weak, nonatomic) IBOutlet UIButton *yanBtn;

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation GLFogetPwdController
- (IBAction)btnClick:(id)sender {
}

- (IBAction)yanBtnClick:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *color = UIColorFromRGB(0xF8F8F8);
    self.view.backgroundColor = color;
    self.btn.layer.cornerRadius = 3;
    self.btn.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1];
    self.yanBtn.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1];
    self.yanBtn.layer.cornerRadius = 3;
    [self setUpNavgationBar];
}
- (void)setUpNavgationBar
{
    self.navigationItem.title = @"忘记密码";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"标题返回键"] hightImage:[UIImage imageNamed:@"标题返回键"] target:self action:@selector(backToPre) forControlEvent:UIControlEventTouchUpInside];
}

- (void)backToPre
{
    [self dismissViewControllerAnimated:NO completion:nil];
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
