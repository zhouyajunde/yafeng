//
//  headView.m
//  ceshi
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "headView.h"


@interface headView ()


@end


@implementation headView

-(instancetype)init
{
   
    self = [[NSBundle mainBundle] loadNibNamed:@"headView" owner:nil options:nil][0];
    
    if (self) {
        
        self.timeLab.textColor = [UIColor blackColor];
        
        self.timeLab.font = [UIFont fontWithName:@"Helvetica" size:30];
        
    }
    return self;
}

@end
