//
//  GLTabBarController.m
//  食谱
//
//  Created by 郭首龙 on 15/12/10.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import "GLTabBarController.h"
#import "GLTabBar.h"
#import "GLNavigationController.h"
#import "GLHomeViewController.h"
#import "GLYinyangcanController.h"
#import "GLDanganController.h"
#import "GLJiazhangcaiController.h"

@interface GLTabBarController ()<GLTabBarDelegate>

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation GLTabBarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpAllChildViewController];
     [self setUpTabBar];
    // Do any additional setup after loading the view.
}


#pragma mark - 设置tabBar
- (void)setUpTabBar
{
    //自定义tabBar
    GLTabBar *tabBar = [[GLTabBar alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49)];
    UIColor *color = UIColorFromRGB(0xF8F8F8);
    tabBar.backgroundColor = color;
    //设置代理
    tabBar.delegate = self;
    
    tabBar.items = self.items;
    
    [self.view addSubview:tabBar];
    [self.tabBar removeFromSuperview];
}

#pragma mark - 当点击tabBar上的按钮调用
- (void)tabBar:(GLTabBar *)tabBar didClickButton:(NSInteger)index
{
    self.selectedIndex = index;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //NSLog(@"%@",self.tabBar.items);
    
    
}

#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController
{
    //首页
    GLHomeViewController *home = [[GLHomeViewController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"首页"] selectedImage:[UIImage imageNamed:@"首页点击态"] title:@"首页"];
    
    //营养菜
    GLYinyangcanController *more = [[GLYinyangcanController alloc] init];
    [self setUpOneChildViewController:more image:[UIImage imageNamed:@"营养餐"] selectedImage:[UIImage imageNamed:@"营养餐点击态"] title:@"营养餐"];
    
    GLDanganController *dangan = [[GLDanganController alloc] init];
    [self setUpOneChildViewController:dangan image:[UIImage imageNamed:@"营养档案"] selectedImage:[UIImage imageNamed:@"营养档案点击态"] title:@"档案"];
    
    GLJiazhangcaiController *jiazhang = [[GLJiazhangcaiController alloc] init];
    [self setUpOneChildViewController:jiazhang image:[UIImage imageNamed:@"家长圈"] selectedImage:[UIImage imageNamed:@"家长圈点击态"] title:@"家长圈"];
}


#pragma mark - 添加一个子控制器

- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    [self.items addObject:vc.tabBarItem];
    GLNavigationController *nav = [[GLNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
