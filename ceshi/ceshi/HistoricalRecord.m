//
//  HistoricalRecord.m
//  ceshi
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HistoricalRecord.h"

@interface HistoricalRecord ()
- (IBAction)bacBtn:(id)sender;

@end

@implementation HistoricalRecord

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
