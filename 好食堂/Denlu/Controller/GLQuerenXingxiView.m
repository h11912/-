//
//  GLQuerenXingxiView.m
//  好食堂
//
//  Created by 郭首龙 on 16/3/3.
//  Copyright © 2016年 郭首龙. All rights reserved.
//

#import "GLQuerenXingxiView.h"
#import "GLSexController.h"
#import "GLxinsxiViewController.h"
@interface GLQuerenXingxiView ()
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIView *chushengBtn;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property(nonatomic,weak)UIDatePicker *datePicker;//日期选择
@end

@implementation GLQuerenXingxiView
- (IBAction)nextBtnclick:(id)sender {
    GLxinsxiViewController *xingxi = [[GLxinsxiViewController alloc] init];
    [self.navigationController pushViewController:xingxi animated:YES];
}
- (IBAction)chushengBtnClick:(id)sender {
   
    
}

- (void)quxiao{
    //隐藏键盘
    [self.view endEditing:YES];
}

- (void)wanchen{
    //获取时间
    NSDate *selectedDate = self.datePicker.date;

    //格式化日期类
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    //设置日期格式
    formater.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [formater stringFromDate:selectedDate];
    
    //设置textfiled的文本
    
    self.dateTextField.text = dateStr;
    
    //隐藏键盘
  [self.view endEditing:YES];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)sex:(id)sender {
    GLSexController *sex = [[GLSexController alloc] init];
    [self.navigationController pushViewController:sex animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"验证绑定";
    [self.nextBtn setBackgroundColor:[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1]];
    self.nextBtn.layer.cornerRadius = 3;
    [self setUpdatePicker];
}

- (void)setUpdatePicker{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    datePicker.locale = [NSLocale
                         localeWithLocaleIdentifier:@"zh"];
    datePicker.frame = CGRectMake(0, 5, kScreenWidth - 10, 216);
    datePicker.backgroundColor = kColor(255, 255, 255, 1);
    //设置datepicker模式
    datePicker.datePickerMode = UIDatePickerModeDate;
    self.dateTextField.inputView = datePicker;
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    
    toolbar.bounds = CGRectMake(0, 0, kScreenWidth, 44);
    toolbar.backgroundColor = kColor(242, 242, 242, 1);
    
    UIBarButtonItem *quit = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(quxiao)];
    
    UIBarButtonItem *tanhuangBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(wanchen)];
    
    toolbar.items = @[quit,tanhuangBtn,done];
    self.dateTextField.inputAccessoryView = toolbar;
    self.datePicker = datePicker;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
