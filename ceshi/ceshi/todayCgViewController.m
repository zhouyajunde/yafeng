//
//  todayCgViewController.m
//  ceshi
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "todayCgViewController.h"
#import "headView.h"

@interface todayCgViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabview;
@property (weak, nonatomic) IBOutlet UIView *addView;

- (IBAction)bacBtn:(id)sender;
@property (strong, nonatomic) headView *hd;

@end

@implementation todayCgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hd = [[headView alloc]init];
    _tabview.tableHeaderView = self.hd;
    
    NSLog(@"%f",self.addView.center.x);
    NSLog(@"%f",self.addView.center.y);

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    
    // 当前触摸点
    CGPoint currentPoint = [touch locationInView:self.addView.superview];
    // 上一个触摸点
    CGPoint previousPoint = [touch previousLocationInView:self.addView.superview];
    
    // 当前view的中点
    CGPoint center = self.addView.center;
    
    center.x += (currentPoint.x - previousPoint.x);
    center.y += (currentPoint.y - previousPoint.y);
    // 修改当前view的中点(中点改变view的位置就会改变)
    self.addView.center = center;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 当前view的中点
    CGPoint center = CGPointMake(258, 508);
    self.addView.center = center;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    cell.textLabel.text = @"cell";
    return cell;
}

- (IBAction)bacBtn:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        //要执行的动画
        CGRect rect = [self.view frame];
        rect.origin.x = rect.origin.x + rect.size.width;
        [self.view setFrame:rect];
    } completion:^(BOOL finshed){
        [self.view removeFromSuperview];
    }];

}
@end
