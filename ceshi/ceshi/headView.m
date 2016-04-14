//
//  headView.m
//  ceshi
//
//  Created by mac on 16/4/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "headView.h"
#import "timeView.h"

@interface headView ()
@property (weak, nonatomic) IBOutlet timeView *timeLb;

@end


@implementation headView

-(instancetype)init
{
   
    self = [[NSBundle mainBundle] loadNibNamed:@"headView" owner:nil options:nil][0];
    
    if (self) {
        
        self.timeLb.timeLable.textColor = [UIColor blackColor];
        
        self.timeLb.timeLable.font = [UIFont fontWithName:@"Helvetica" size:30];
        
    }
    return self;
}

@end
