//
//  HomeViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/11.
//

#import "HomeViewController.h"
#import <RTMPCHybirdEngine/ARRtmpSDK.h>

@interface HomeViewController ()
<ARHosterRtmpDelegate>
@property (nonatomic, strong) ARRtmpHosterKit *hosterKit;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"首页";
    self.view.backgroundColor = RandomColor;
    
    ARHosterOption *option = [ARHosterOption defaultOption];
    option.videoProfile = ARVideoProfile144x192;
//    ARVideoProfile288x352
//    option.videoFrameRate = 10;
    option.livingMediaMode = ARLivingMediaModeVideo;
    //实例化主播对象
//    self.hosterKit = [[ARRtmpHosterKit alloc] initWithDelegate:self option:option];
//    [self.hosterKit setLocalVideoCapturer:self.view];
//    NSString *urlStr = @"rtmp://ev.yxybb.com/append/42100419920521421X110000019000202101000231610361045219";
//    [self.hosterKit startPushRtmpStream:urlStr];
    
}

- (void)onRtmpStreamOk {
    //RTMP 服务连接成功
    NSLog(@"RTMP服务链接成功");
}

- (void)onRtmpStreamReconnecting:(int)times {
    //RTMP 服务重连
    NSLog(@"服务重连<##>");
}

- (void)onRtmpStreamStatus:(int)delayTime netBand:(int)netBand {
    //RTMP 推流状态
    NSString *text = [NSString stringWithFormat:@"RTMP延迟:%.2fs 当前上传网速:%.2fkb/s",delayTime/1000.00,netBand/1024.00/8];
    NSLog(@"%@",text);
}

- (void)onRtmpStreamFailed:(ARRtmpCode)code {
    //RTMP 服务连接失败
    NSLog(@"RTMP服务连接失败");
}

- (void)onRtmpStreamClosed {
    //RTMP 服务关闭
    NSLog(@"RTMP服务关闭");
}




@end
