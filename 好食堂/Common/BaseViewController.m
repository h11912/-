/*
 ***************************************************************************
 * 建立日期	： 2014-04-15
 * 版权声明	： 本代码版权归圣笛科技所有，禁止任何未授权的传播和使用
 * 作者		： yanjiaming@sainti.com
 * 模块		：
 * 描述		： BaseViewController
 * -------------------------------------------------------------------------
 * 修改历史
 * 序号			日期					修改人				修改原因
 * <#序号#>        <#日期#>                <#修改人#>              <#修改原因#>
 *
 ***************************************************************************
 */

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "UITabBarItem+Item.h"
@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF8F8F8);
    //导航栏背景是否透明
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"标题返回键"] hightImage:[UIImage imageNamed:@"标题返回键"] target:self action:@selector(backToPre) forControlEvent:UIControlEventTouchUpInside];
    

//    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];

}
-(void)backToPre
{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
 方法说明:
 添加并显示等待条
 
 参数说明:
 UIView* view        添加等待条的View对象
 BOOL    isAnimated  是否出现动画
 
 返回结果:
 void
 */
- (void)showProgressWithView:(UIView*)view animated:(BOOL)isAnimated{
    [self hideProgress:view animated:NO];
    
    MBProgressHUD *loading = [MBProgressHUD showHUDAddedTo:view animated:isAnimated];
    loading.mode=MBProgressHUDModeIndeterminate;
    loading.color = [UIColor lightGrayColor];
    
    _hideProgressTimer = [NSTimer scheduledTimerWithTimeInterval:20.0f
                                                          target:self
                                                        selector:@selector(handleTimer:)
                                                          userInfo:view
                                                         repeats:NO];
}
/*
 方法说明:
 隐藏并释放等待条
 
 参数说明:
 UIView* view        隐藏并释放等待条的View对象
 BOOL    isAnimated  是否出现动画
 
 返回结果:
 void
 */
- (void)hideProgress:(UIView*)view animated:(BOOL)isAnimated{
    
    if (nil != _hideProgressTimer && [_hideProgressTimer isValid]) {
        [_hideProgressTimer invalidate];
        //        [_hideProgressTimer release];
        _hideProgressTimer = nil;
    }
    [MBProgressHUD hideHUDForView:view animated:isAnimated];
    
}

/*
 方法说明:
 定时隐藏并释放等待条
 
 参数说明:
 定时器对象
 
 返回结果:
 void
 */
- (void)handleTimer:(NSTimer *)timer {
    
    [self hideProgress:[timer userInfo] animated:YES];
}
- (void)btnBackClicked:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
