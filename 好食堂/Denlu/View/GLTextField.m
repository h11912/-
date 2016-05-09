//
//  GLTextField.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/2.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLTextField.h"
static NSString * const XMGPlacerholderColorKeyPath = @"_placeholderLabel.textColor";
@implementation GLTextField
/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder
{
    // 修改占位文字颜色
    [self setValue:self.textColor forKeyPath:XMGPlacerholderColorKeyPath];
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor colorWithRed:213.0/255.0 green:213.0/255.0 blue:213.0/255.0 alpha:1] forKeyPath:XMGPlacerholderColorKeyPath];
    return [super resignFirstResponder];
}

- (void)awakeFromNib
{
    // 设置光标颜色和文字颜色一致
    self.tintColor = self.textColor;
    
    // 不成为第一响应者
    [self resignFirstResponder];
}


@end
