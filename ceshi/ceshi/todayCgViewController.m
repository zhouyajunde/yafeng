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

@property (weak, nonatomic) IBOutlet UIView *headView;

@end

@implementation todayCgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    headView *hd = [[headView alloc]init];
    _tabview.tableHeaderView = hd;
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

@end
