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
#import "UIImage+UIImage_Circle.h"
#import "ChallengeTodaynoPerson.h"
#import "HistoricalRecord.h"

@interface ViewController ()


@property (strong,nonatomic) xingqingViewController *xb;
@property (strong,nonatomic) ChallengeTodaynoPerson *chperson;
@property (strong,nonatomic) HistoricalRecord *htrecord;
@property (strong,nonatomic) todayCgViewController *cgview;


@property (weak, nonatomic) IBOutlet UIButton *tiaozhuan;

@property (weak, nonatomic) IBOutlet UIImageView *imgede;
- (IBAction)btn:(id)sender;
- (IBAction)jinri:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *lab;

@property (weak, nonatomic) IBOutlet BBFlashCtntLabel *viewLab;
@property (weak, nonatomic) IBOutlet UILabel *paomaDe;

- (IBAction)jinrnoChange:(id)sender;
- (IBAction)lishiBtn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgede.image = [UIImage circleImageWithName:@"imgaead" borderWidth:2 borderColor:[UIColor whiteColor]];
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
    
    _xb = [[xingqingViewController alloc]init];
    
   
    
//    if (![self.view.subviews containsObject:_xb.view]) {
        [self AddView:_xb.view];
//    }
    
//    [UIView animateWithDuration:0.3 animations:^{
//        //要执行的动画
//        [super.navigationController setNavigationBarHidden:YES];
//        [self.view addSubview:xb.view];
//    } completion:^(BOOL finshed){
//        
////        [self.view removeFromSuperview];
//    }];
//    
//    CATransition *animation = [CATransition animation];
//    [animation setDuration:0.5];
//    [animation setType:kCATransitionPush];
//    [animation setSubtype:kCATransitionFromRight];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [[xb.view layer] addAnimation:animation forKey:@"SwitchToView"];
//    
//    
////    xb.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:xb animated:NO completion:nil];
    
//    [self.navigationController pushViewController:xb animated:YES];
}

-(void)AddView:(UIView*)view
{
    [view setFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    [self.view.superview addSubview:view];
    int ix=self.view.superview.frame.origin.x;
    int ih=self.view.frame.size.height;
    CGRect rect = [self.view frame];
    //    if (isArLang())//DTS2015081201198 20150818 modified by wwx277866
    //    {
    //        rect.origin.x = rect.origin.x - rect.size.width;
    //    }
    //    else
    //    {
    rect.origin.x = rect.origin.x + rect.size.width;
    //    }
    rect.size.height = CGRectGetHeight([UIScreen mainScreen].bounds);
    [view setFrame:rect];
    [UIView animateWithDuration:0.3 animations:^{
        //要执行的动画
        [view setFrame:CGRectMake(0-ix, 0, CGRectGetWidth([UIScreen mainScreen].bounds), ih)];
    } completion:^(BOOL finshed){
    }];
}
- (IBAction)jinri:(id)sender {
    
    _cgview = [[todayCgViewController alloc]init];
    
    [super.navigationController setNavigationBarHidden:YES];
    if (![self.view.subviews containsObject:_cgview.view]) {
        [self AddView:_cgview.view];
    }

    
//    todayCgViewController *tc = [[todayCgViewController alloc]init];
//    
//    [self.navigationController pushViewController:tc animated:YES];
}
- (IBAction)jinrnoChange:(id)sender {
    
    
    _chperson = [[ChallengeTodaynoPerson alloc]init];
    
     [super.navigationController setNavigationBarHidden:YES];
    if (![self.view.subviews containsObject:_chperson.view]) {
               [self AddView:_chperson.view];
    }
    
}

- (IBAction)lishiBtn:(id)sender {
    
    _htrecord = [[HistoricalRecord alloc]init];
    
    [super.navigationController setNavigationBarHidden:YES];
    if (![self.view.subviews containsObject:_htrecord.view]) {
        [self AddView:_htrecord.view];
    }

}
@end
