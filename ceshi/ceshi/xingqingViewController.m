//
//  xingqingViewController.m
//  zhege
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 Mac os. All rights reserved.
//

#import "xingqingViewController.h"
#import "timeLabel.h"

@interface xingqingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *todayCg;
@property (weak, nonatomic) IBOutlet timeLabel *timL;
@property (weak, nonatomic) IBOutlet UITableView *tabview;
- (IBAction)Btn:(id)sender;
- (IBAction)allCg:(id)sender;

@end

@implementation xingqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.timL.textColor = [UIColor redColor];
    
    self.timL.font = [UIFont fontWithName:@"Helvetica" size:30];
    
    [_todayCg.layer setMasksToBounds:YES];
    [_todayCg.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [_todayCg.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [_todayCg.layer setBorderColor:colorref];//边框颜色
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    cell.textLabel.text = @"cell";
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
     [super.navigationController setNavigationBarHidden:YES];
}

- (IBAction)Btn:(id)sender {
    
    NSLog(@"00");
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    [UIView animateWithDuration:0.3 animations:^{
        //要执行的动画
        CGRect rect = [self.view frame];
        rect.origin.x = rect.origin.x + rect.size.width;
        [self.view setFrame:rect];
    } completion:^(BOOL finshed){
        [self.view removeFromSuperview];
    }];

}

- (IBAction)allCg:(id)sender {
    NSLog(@"00");
//    [UIView animateWithDuration:0.3 animations:^{
//        //要执行的动画
//        CGRect rect = [self.view frame];
//        rect.origin.x = rect.origin.x + rect.size.width;
//        [self.view setFrame:rect];
//    } completion:^(BOOL finshed){
//        [self.view removeFromSuperview];
//    }];
//
}
@end
