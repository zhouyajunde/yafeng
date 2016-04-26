//
//  ChallengeTodaynoPerson.m
//  ceshi
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChallengeTodaynoPerson.h"
#import "PreHelper.h"

@interface ChallengeTodaynoPerson ()
@property (weak, nonatomic) IBOutlet UIButton *challengeBtn;
- (IBAction)startChallenge:(id)sender;
- (IBAction)bacBtn:(id)sender;
- (IBAction)historyBtn:(id)sender;

@end

@implementation ChallengeTodaynoPerson

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (IBAction)startChallenge:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        //要执行的动画
        CGRect rect = [self.view frame];
        rect.origin.x = rect.origin.x + rect.size.width;
        [self.view setFrame:rect];
    } completion:^(BOOL finshed){
        [self.view removeFromSuperview];
    }];

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

- (IBAction)historyBtn:(id)sender {
}
@end
