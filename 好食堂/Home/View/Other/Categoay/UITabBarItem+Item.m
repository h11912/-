//
//  UITabBarItem+Item.m
//  01-微博
//
//  Created by 郭首龙 on 15/11/21.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import "UITabBarItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image hightImage:(UIImage *)hightImage target:(id)target action:(SEL)action forControlEvent:(UIControlEvents)controlEvents
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:hightImage forState:UIControlStateHighlighted];
//    [btn sizeToFit];
    btn.frame = CGRectMake(10, 30, 20, 20);
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
