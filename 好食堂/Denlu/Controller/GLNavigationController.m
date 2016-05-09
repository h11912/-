//
//  GLNavigationController.m
//  食谱
//
//  Created by 郭首龙 on 15/12/10.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import "GLNavigationController.h"
#import "UITabBarItem+Item.h"
@interface GLNavigationController ()

@end

@implementation GLNavigationController

+ (void)initialize
{
 
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSDictionary *titleAttr = @{
                                NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:17]
                              
                                };
    [navBar setTitleTextAttributes:titleAttr];
   
    [navBar setBackgroundImage:[UIImage imageNamed:@"标题栏"] forBarMetrics:UIBarMetricsDefault];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"标题返回键"] hightImage:[UIImage imageNamed:@"标题返回键"] target:self action:@selector(backToPre) forControlEvent:UIControlEventTouchUpInside];
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)backToPre
{
    [self popViewControllerAnimated:YES];
}
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    UITabBarController *tabBarVc = (UITabBarController *)GLKeyWindow.rootViewController;
//    
//    for (UIView *tabBarButton in tabBarVc.tabBar.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tabBarButton removeFromSuperview];
//        }
//    }
//}


- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view.
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
