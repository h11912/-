//
//  GLnavBar.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/1.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLnavBar.h"
#define GLScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation GLnavBar

@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;
@synthesize navTitle = _navTitle;



- (GLnavBar *)initCustomNaviBarViewOnController:(UIViewController*)controller leftTitle:(UIImage *)leftTitle rightTitle:(UIImage *)rightTitle centerTitle:(NSString*)centerTitle
{
    //1.创建导航栏视图
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    if (self != nil)//当导航视图没有加载成功的时候推出该方法
    {
        //1.为导航视图设置背景
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = [UIImage imageNamed:@"标题栏"];
        [self addSubview:imageView];
        [[controller navigationController] setNavigationBarHidden:YES animated:YES];
        
        //2.导航面板左边的取消按钮
        _leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if (_leftButton != nil)
        {
            _leftButton.frame = CGRectMake(15, 30, 30, 30);
            
            [_leftButton setBackgroundImage:leftTitle forState:UIControlStateNormal];
            [self addSubview:_leftButton];
        }
        //3.导航面板右边的发布按钮
        _rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if (_rightButton != nil)
        {
            [_rightButton setFrame:CGRectMake(GLScreenWidth - 80, 32, 30, 30)];
            if (_rightButton != nil) {
                [_rightButton setBackgroundImage:rightTitle forState:UIControlStateNormal];
            }
            
            [self addSubview:_rightButton];
        }
        
        //4.导航面板中部文字
        _navTitle = [[UILabel alloc] initWithFrame:CGRectMake(80, 32, GLScreenWidth - 80 - 80, 30)];
        if (_navTitle != nil)
        {
            [_navTitle setTextColor:[UIColor blackColor]];
            if (centerTitle != nil)
            {
                _navTitle.text = centerTitle;
            }else
            {
            }
            [_navTitle setTextAlignment:NSTextAlignmentCenter];
            _navTitle.font = [UIFont systemFontOfSize:17.0];
            _navTitle.textColor = [UIColor whiteColor];
            [self addSubview:_navTitle];
        }
        
        //5.在导航视图底添加分割线
//        UIView *navDividingLine = [[UIView alloc] init];
//        if (navDividingLine != nil)
//        {
//            navDividingLine.frame = CGRectMake(0, 20 + 44, GLScreenWidth, 1);
//            navDividingLine.backgroundColor = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1];
//            [self addSubview:navDividingLine];
//        }
        
    }
    return self;
}

@end
