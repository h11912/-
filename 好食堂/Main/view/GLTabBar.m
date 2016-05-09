//
//  GLTabBar.m
//  食谱
//
//  Created by 郭首龙 on 15/12/10.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import "GLTabBar.h"
#import "GLTabBarButton.h"

@interface GLTabBar ()

@property (nonatomic,weak) UIButton *selectedButton;
/**
 *  保存tabbaritems
 */
@property (nonatomic,strong) NSMutableArray *buttons;

@end


@implementation GLTabBar

- (NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    // 遍历模型数组，创建对应tabBarButton
    for (UITabBarItem *item in _items) {
        GLTabBarButton *btn = [GLTabBarButton buttonWithType:UIButtonTypeCustom];
         // 给按钮赋值模型，按钮的内容由模型对应决定
        btn.item = item;
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
}

- (void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    // 通知tabBarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

// 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / self.items.count;
    CGFloat btnH = h;
    
    int i = 0;
    for (UIView *tabBarButton in self.buttons) {
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
}

@end
