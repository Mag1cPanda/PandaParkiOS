//
//  RTMPDemoViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import "RTMPDemoViewController.h"
#import <RTMPCHybirdEngine/ARRtmpSDK.h>

@interface RTMPDemoViewController ()
<ARHosterRtmpDelegate>
@property (nonatomic, strong) ARRtmpHosterKit *hosterKit;
@end

@implementation RTMPDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"推流";
    
    UIView *preview = [UIView new];
    [self.view addSubview:preview];
    [preview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(300);
    }];
    
    ARHosterOption *option = [ARHosterOption defaultOption];
    option.videoProfile = ARVideoProfile144x192;
//    ARVideoProfile288x352
//    option.videoFrameRate = 10;
    option.livingMediaMode = ARLivingMediaModeVideo;
    //实例化主播对象
    self.hosterKit = [[ARRtmpHosterKit alloc] initWithDelegate:self option:option];
    [self.hosterKit setLocalVideoCapturer:preview];
//    NSString *urlStr = @"rtmp://ev.yxybb.com/append/42100419920521421X110000019000202101000301610959719888";
//    NSString *urlStr = @"rtmp://ev.yxybb.com/append/42100419920521421X110000019000202101000231610361045219";
    NSString *urlStr = @"rtmp://ev.yxybb.com/append/42100419920521421X110000019000202101000311610960922197";

    [self.hosterKit startPushRtmpStream:urlStr];
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
