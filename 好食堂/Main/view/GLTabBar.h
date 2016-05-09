//
//  GLTabBar.h
//  食谱
//
//  Created by 郭首龙 on 15/12/10.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GLTabBar;

@protocol GLTabBarDelegate <NSObject>

@optional

- (void)tabBar:(GLTabBar *)tabBar didClickButton:(NSInteger)index;

@end



@interface GLTabBar : UIView
/**
 *  items保存每一个按钮对应的tabbaritems模型
 */
@property (nonatomic,strong) NSArray *items;

@property (nonatomic,weak) id<GLTabBarDelegate> delegate;

@end
