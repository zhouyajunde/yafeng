//
//  ViewController.m
//  A-Z 拼音排序
//
//  Created by 云滴科技 on 16/3/30.
//  Copyright © 2016年 云滴科技. All rights reserved.
//

#import "ViewController.h"
#import "ChineseToPinyin.h"
#import <FMDB.h>


#define ScreenSize  ([UIScreen mainScreen].bounds.size)
#define RGB(R,G,B)       [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1.f];

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *nameArray;
    NSArray * nameTypeArray;
    
    UITableView * myTableView;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documents = [paths objectAtIndex:0];
//    NSString *database_path = [documents stringByAppendingPathComponent:@"list.plist"];
//    
//   FMDatabase *db = [FMDatabase databaseWithPath:database_path];
    
    
    //1.获得数据库文件的路径
        NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName=[doc stringByAppendingPathComponent:@"student.sqlite"];
  
   //2.获得数据库
    FMDatabase *db=[FMDatabase databaseWithPath:fileName];
    
   //3.打开数据库
   if ([db open]) {
        //4.创表
        BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
     if (result) {
             NSLog(@"创表成功");
         }else
              {
                        NSLog(@"创表失败");
                   }
        }
//        self.db=db;
    
    
    nameArray = [[NSMutableArray alloc]initWithObjects:@"鲁迅",@"刘一",@"赵四",@"钱",@"李三",@"孙五",@"王二",@"黄蓉",@"孙悟空",@"哪吒",@"李天王",@"范冰冰",@"赵丽颖",@"霍建华",@"黄晓明",@"成龙",@"李连杰",@"李小龙",@"曾小贤",@"LiShan",@"陈真", nil];
    
    nameTypeArray = [ChineseToPinyin LQQSortDataByFirstLetterWithArray:nameArray isIncludeKeys:YES];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:myTableView];
    
}

#pragma mark -- tableView代理 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary * dictionary = [nameTypeArray objectAtIndex:section];
    NSArray * array = [dictionary objectForKey:@"value"];
    return array.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return nameTypeArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, 40)];
    label.backgroundColor = [UIColor blackColor];
    NSDictionary * dictionary = [nameTypeArray objectAtIndex:section];
    NSString * string = [dictionary objectForKey:@"key"];
    label.textColor = [UIColor whiteColor];
    label.text = string;
    return label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary * dictionary = [nameTypeArray objectAtIndex:indexPath.section];
    NSArray * array = [dictionary objectForKey:@"value"];
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    return cell;
}

@end
