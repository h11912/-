//
//  UITabBarItem+Item.h
//  01-微博
//
//  Created by 郭首龙 on 15/11/21.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image hightImage:(UIImage *)hightImage target:(id)target action:(SEL)action forControlEvent:(UIControlEvents)controlEvents;
@end
