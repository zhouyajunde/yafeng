//
//  xingqingViewController.m
//  zhege
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 Mac os. All rights reserved.
//

#import "xingqingViewController.h"
#import "timeView.h"

@interface xingqingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *todayCg;
@property (weak, nonatomic) IBOutlet timeView *timL;

@end

@implementation xingqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.timL.timeLable.textColor = [UIColor redColor];
    
    self.timL.timeLable.font = [UIFont fontWithName:@"Helvetica" size:30];
    
    [_todayCg.layer setMasksToBounds:YES];
    [_todayCg.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [_todayCg.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [_todayCg.layer setBorderColor:colorref];//边框颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
