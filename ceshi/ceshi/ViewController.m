//
//  ViewController.m
//  ceshi
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "xingqingViewController.h"
#import "todayCgViewController.h"
#import "BBFlashCtntLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *tiaozhuan;

- (IBAction)btn:(id)sender;
- (IBAction)jinri:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *lab;

@property (weak, nonatomic) IBOutlet BBFlashCtntLabel *viewLab;
@property (weak, nonatomic) IBOutlet UILabel *paomaDe;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = _paomaDe.frame;
    frame.origin.x = -180;
    _paomaDe.frame = frame;
    
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:8.8f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999];
    
    frame = _paomaDe.frame;
    frame.origin.x = 350;
    _paomaDe.frame = frame;
    [UIView commitAnimations];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [_lab.layer addAnimation:animation forKey:@"shake"];

}
- (IBAction)btn:(id)sender {
    
    xingqingViewController *xb = [[xingqingViewController alloc]init];
    
    [self.navigationController pushViewController:xb animated:YES];
}
- (IBAction)jinri:(id)sender {
    
    todayCgViewController *tc = [[todayCgViewController alloc]init];
    
    [self.navigationController pushViewController:tc animated:YES];
}
@end
