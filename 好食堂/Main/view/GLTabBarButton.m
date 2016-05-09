//
//  GLTabBarButton.m
//  食谱
//
//  Created by 郭首龙 on 15/12/10.
//  Copyright © 2015年 郭首龙. All rights reserved.
//

#import "GLTabBarButton.h"

@implementation GLTabBarButton
// 重写setHighlighted，取消高亮做的事情
- (void)setHighlighted:(BOOL)highlighted{}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       UIColor *color = UIColorFromRGB(0xFD560d);
        [self setTitleColor:color forState:UIControlStateSelected];
        
        UIColor *colorb = UIColorFromRGB(0x666666);
        [self setTitleColor:colorb forState:UIControlStateNormal];
        //图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
    
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //设置文字字体
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        
//        for(NSString *familyName in [UIFont familyNames])
//        {
//            NSLog(@"familyName = %@", familyName);
//            
//            for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName])
//            {
//                NSLog(@"\tfontName = %@", fontName);
//            }  
//        }
        
    }
    return self;
}

// 传递UITabBarItem给tabBarButton,给tabBarButton内容赋值
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    //kvo
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
}

// 只要监听的属性一有新值，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    
}

// 修改按钮内部子控件的frame

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.7;

    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    //title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
}

@end
