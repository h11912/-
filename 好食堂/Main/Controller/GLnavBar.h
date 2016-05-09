//
//  GLnavBar.h
//  好食堂
//
//  Created by 郭首龙 on 16/3/1.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLnavBar : UINavigationBar
{
@private
    /**
     *  左侧按钮
     */
    UIButton* _leftButton;
    /**
     *  右侧按钮
     */
    UIButton* _rightButton;
    /**
     *  中部标签
     */
    UILabel* _navTitle;
}

@property(nonatomic,strong)UIButton* leftButton;
@property(nonatomic,strong)UIButton* rightButton;
@property(nonatomic,strong)UILabel* navTitle;

/**
 *  返回一个自定义导航条
 *
 *  @param controller  控制器对象
 *  @param leftTitle   导航左侧文本，默认：@"取消"
 *  @param rightTitle  导航右侧文本
 *  @param centerTitle 导航中部文本
 *
 *  @return 导航条对象
 */
- (GLnavBar*)initCustomNaviBarViewOnController:(UIViewController*)controller leftTitle:(UIImage*)leftTitle rightTitle:(UIImage*)rightTitle centerTitle:(NSString*)centerTitle;
@end
