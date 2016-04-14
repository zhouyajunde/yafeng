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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *tiaozhuan;

- (IBAction)btn:(id)sender;
- (IBAction)jinri:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
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
