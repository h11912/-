//
//  GLxinsxiViewController.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/4.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLxinsxiViewController.h"
#import "GLTabBarController.h"

@interface GLxinsxiViewController ()

@property (weak, nonatomic) IBOutlet UIButton *retian;
@property (weak, nonatomic) IBOutlet UIButton *next;

@end

@implementation GLxinsxiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认信息";
    [self.next setBackgroundColor:UIColorFromRGB(0xfd6523)];
    [self.next setTitleColor:kWhiteColor forState:UIControlStateNormal];
    self.next.layer.cornerRadius = 3;
    [self.retian setBackgroundColor:UIColorFromRGB(0xcdcdcd)];
    [self.retian setTitleColor:UIColorFromRGB(0x7f7f7f) forState:UIControlStateNormal];
    [self.retian setTitleColor:kColor(255, 255, 255, 1) forState:UIControlStateNormal];
    self.retian.layer.cornerRadius = 3;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextBtnClick:(id)sender {
 
     GLTabBarController *tabbarVc = [[GLTabBarController alloc] init];
   [self presentViewController:tabbarVc animated:NO completion:^{
       
   }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)retian:(id)sender {
    [self.navigationController popoverPresentationController];
}


@end
