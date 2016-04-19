//
//  paomViewController.m
//  ceshi
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "paomViewController.h"
#import "BBFlashCtntLabel.h"

@interface paomViewController ()

@end

@implementation paomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 5; i++) {
        CGRect rect = CGRectMake(20, 450 - i * 52, 180, 50);
        BBFlashCtntLabel *lbl = [[BBFlashCtntLabel alloc] initWithFrame:rect];
        lbl.backgroundColor = [UIColor lightGrayColor];
        lbl.leastInnerGap = 50.f;
        if (i % 3 == 0) {
            lbl.repeatCount = 5;
            lbl.speed = BBFlashCtntSpeedSlow;
        } else if (i % 3 == 1) {
            lbl.speed = BBFlashCtntSpeedMild;
        } else {
            lbl.speed = BBFlashCtntSpeedFast;
        }
        NSString *str = @"测试文字。来来；‘了哈哈😄^_^abcdefg123456👿";
        
        if (i %2 == 0) {
            lbl.text = str;
            lbl.font = [UIFont systemFontOfSize:25];
            lbl.textColor = [UIColor whiteColor];
        } else {
            NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:str];
            [att addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:25]
                        range:NSMakeRange(0, 5)];
            [att addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:17]
                        range:NSMakeRange(15, 5)];
            [att addAttribute:NSBackgroundColorAttributeName
                        value:[UIColor cyanColor]
                        range:NSMakeRange(0, 15)];
            [att addAttribute:NSForegroundColorAttributeName
                        value:[UIColor redColor]
                        range:NSMakeRange(8, 7)];
            lbl.attributedText = att;
        }
        if (i == 0) {
            lbl.textColor = [UIColor greenColor];
            lbl.text = @"少量文字";
        }
        
        [self.view addSubview:lbl];
    }

}


@end
