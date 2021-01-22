//
//  CountDownDemoVC.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/22.
//

#import "CountDownDemoVC.h"
#import "MZTimerLabel.h"

@interface CountDownDemoVC ()

@end

@implementation CountDownDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat y = NavigationBarHeight+StatusBarHeight+20;
   
    //秒表
    MZTimerLabel *stopWatch = [[MZTimerLabel alloc] initWithFrame:CGRectMake(20, y, 200, 30)];
    stopWatch.timeLabel.font = [UIFont systemFontOfSize:20];
    stopWatch.timeLabel.textColor = UIColor.redColor;
    stopWatch.timeFormat = @"HH:mm:ss SS";
    [self.view addSubview:stopWatch];
    [stopWatch start];
    
    //倒计时
//    UILabel *countDown = [[UILabel alloc] initWithFrame:CGRectMake(20, y, 100, 30)];
//    [self.view addSubview:countDown];
//    MZTimerLabel *timer = [[MZTimerLabel alloc] initWithLabel:countDown andTimerType:MZTimerLabelTypeTimer];
//    [timer setCountDownTime:60];
//    [timer start];
}


@end
