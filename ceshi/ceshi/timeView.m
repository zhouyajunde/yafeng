
#import "timeView.h"

@interface timeView ()
{
    
}
@property (nonatomic, strong) NSTimer *currentTimeTimer;

@end


@implementation timeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self timerFireMethod];
        self.currentTimeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod) userInfo:nil repeats:YES];
        
        [[NSRunLoop mainRunLoop] addTimer:self.currentTimeTimer forMode:NSRunLoopCommonModes];
               
        _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _timeLable.textColor = [UIColor whiteColor];
      
        _timeLable.textAlignment = NSTextAlignmentCenter;
     
        [self addSubview:_timeLable];
        
    }
    return self;
}

- (void)timerFireMethod
{
    long long time = [self getCurrentTime];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02d",time/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02d",(time%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02d",time%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    _timeLable.text = format_time;
    
}
// 获取当前时间
-( long long )getCurrentTime{

    NSDate *senddate=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:senddate];
    
    long long a = [[dateString substringToIndex:2]longLongValue];
    long long  c = [[dateString substringWithRange:NSMakeRange(3,2)]longLongValue];
    long long b = [[dateString substringFromIndex:6]longLongValue];
    
    long long  time =   [self getEndTime] -  (a*60*60 + c*60 + b);
    return time;
}

// 获取0
-( long long )getEndTime{
    
    NSString *dateString = @"23:59:59";
    
    long long a = [[dateString substringToIndex:2]longLongValue];
    long long  c = [[dateString substringWithRange:NSMakeRange(3,2)]longLongValue];
    long long b = [[dateString substringFromIndex:6]longLongValue];
    
    long long  time = (a*60*60 + c*60 + b);
    return time;
}
@end
