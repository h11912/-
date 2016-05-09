//
//  GLHomeViewController.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/1.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLHomeViewController.h"
#import "GLnavBar.h"
#import "ImagePlayerView.h"
#import <ImagePlayerView/ImagePlayerView.h>
#import "UIImageView+AFNetworking.h"
#import "SendRequest.h"
#define GLScreenWidth [UIScreen mainScreen].bounds.size.width
@interface GLHomeViewController ()<ImagePlayerViewDelegate>
@property (weak, nonatomic) IBOutlet ImagePlayerView *adView;
@property (nonatomic, strong) NSArray *imageURLs;

@end

@implementation GLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIColor *color = UIColorFromRGB(0xF8F8F8);
    self.view.backgroundColor = color;
    GLnavBar * customNaviBarView = [[GLnavBar alloc] initCustomNaviBarViewOnController:self leftTitle:[UIImage imageNamed:@"首页我的"] rightTitle:nil centerTitle:@"好食堂"];
    if (customNaviBarView != nil)
    {
        [customNaviBarView.leftButton addTarget:self action:@selector(cancelButtonEventTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:customNaviBarView];
    }
    
    
    self.imageWidth.constant = GLScreenWidth;
    self.imageURLs = @[[NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://pic1.ajkimg.com/display/xinfang/e0f12b875cedfa0cdf6c0d2bcc9640ee/500x600.jpg"],
                       [NSURL URLWithString:@"http://fzone.oushinet.com/bbs/data/attachment/forum/201208/15/074140zsb6ko6hfhzrb40q.jpg"]];
    self.adView.imagePlayerViewDelegate = self;
    
    // set auto scroll interval to x seconds
    self.adView.scrollInterval = 3.0f;

    // adjust pageControl position
    self.adView.pageControlPosition = ICPageControlPosition_BottomCenter;
    
    // hide pageControl or not
    self.adView.hidePageControl = NO;
    
    // adjust edgeInset
    //    self.imagePlayerView.edgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
    
    [self.adView reloadData];

    // Do any additional setup after loading the view.
}

- (void)cancelButtonEventTouchUpInside{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfItems
{
    return self.imageURLs.count;
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    // recommend to use SDWebImage lib to load web image
    [imageView setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:IMAGE(@"navback")];
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.imageURLs objectAtIndex:index]]];
    //    });
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"did tap index = %d", (int)index);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //GCD执行耗时操作
    [self showProgressWithView:self.view animated:YES];
    
    [SendRequest orderDetailWith:@"" result:^(NSDictionary *result, NSError *error){
       [self hideProgress:self.view animated:YES];
   }];
    
 

    
}

@end
