//
//  GLSexController.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/4.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLSexController.h"

@interface GLSexController ()
@property (weak, nonatomic) IBOutlet UIButton *nanBtn;
@property (weak, nonatomic) IBOutlet UIButton *nvBtn;
@property (weak, nonatomic) IBOutlet UIImageView *nanImage;
@property (weak, nonatomic) IBOutlet UIImageView *nvImage;

@end

@implementation GLSexController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"性别";
    self.nanBtn.backgroundColor = kColor(255, 255, 255, 1);
     self.nvBtn.backgroundColor = kColor(255, 255, 255, 1);
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nanBtn:(id)sender {
    if (self.nanBtn.selected == NO) {
        self.nvImage.image = nil;
        self.nanImage.image = [UIImage imageNamed:@"性别勾选"];
    }else if (self.nanBtn.selected == YES){
         self.nanImage.image = nil;
    }

}
- (IBAction)nvBtn:(id)sender {
    if (self.nvBtn.selected == NO) {
        self.nanImage.image = nil;
        self.nvImage.image = [UIImage imageNamed:@"性别勾选"];
    }else if (self.nvBtn.selected == YES){
          self.nvImage.image = nil;
    }
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
