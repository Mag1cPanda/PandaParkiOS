//
//  RTMPDemoViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import "RTMPDemoViewController.h"
//anyRTC
#import <RTMPCHybirdEngine/ARRtmpSDK.h>
//金山云
#import <KSYGPUStreamerKit.h>

@interface RTMPDemoViewController ()
<ARHosterRtmpDelegate>
@property (nonatomic, strong) ARRtmpHosterKit *hosterKit;

@property(nonatomic, strong) UIView *preView;

@property(nonatomic, strong) KSYGPUStreamerKit *kit;

@property(nonatomic, assign) BOOL isFullScreen;
@end

@implementation RTMPDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"推流";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithTitle:@"Change" target:self action:@selector(changeStyle)];
    
    _preView = [UIView new];
    CGFloat y = NavigationBarHeight+StatusBarHeight+20;
    _preView.frame = CGRectMake(SCREEN_WIDTH-120, y, 100, 100);
    [self.view addSubview:_preView];

    
//    [self testAnyRTC];
    
    [self testKSY];
}

- (void)changeStyle
{
    if (_isFullScreen) {
        [self originalStyle];
    } else {
        [self fullScreen];
    }
}

-(void)fullScreen
{
    _isFullScreen = YES;
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.preView.frame = self.view.bounds;
        weakSelf.kit.preview.frame = weakSelf.preView.bounds;
    }];
}

-(void)originalStyle
{
    _isFullScreen = NO;
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.preView.frame = CGRectMake(SCREEN_WIDTH-120, NavigationBarHeight+20, 100, 100);
        weakSelf.kit.preview.frame = weakSelf.preView.bounds;
    }];
}

- (void)testKSY
{
    [self.kit startPreview:self.preView];
//    NSString *urlStr = @"rtmp://192.168.3.56:1935/rtmplive/room";
//    [_kit.streamerBase startStream:[NSURL URLWithString:urlStr]];
}

- (void)testAnyRTC
{
    ARHosterOption *option = [ARHosterOption defaultOption];
    option.videoProfile = ARVideoProfile144x192;
//    ARVideoProfile288x352
//    option.videoFrameRate = 10;
    option.livingMediaMode = ARLivingMediaModeVideo;
    //实例化主播对象
    self.hosterKit = [[ARRtmpHosterKit alloc] initWithDelegate:self option:option];
    [self.hosterKit setLocalVideoCapturer:_preView];
//    NSString *urlStr = @"rtmp://ev.yxybb.com/append/42100419920521421X110000019000202101000301610959719888";
//    NSString *urlStr = @"rtmp://ev.yxybb.com/append/42100419920521421X110000019000202101000231610361045219";
    NSString *urlStr = @"rtmp://192.168.3.56:1935/rtmplive/room";

    [self.hosterKit startPushRtmpStream:urlStr];
}

#pragma mark - ARHosterRtmpDelegate
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

#pragma mark - getter
- (KSYGPUStreamerKit *)kit
{
    if (!_kit) {
        _kit = [[KSYGPUStreamerKit alloc] initWithDefaultCfg];
    //    _kit.streamerProfile = KSYStreamerProfile_360p_1;
        
        _kit.capPreset = AVCaptureSessionPresetLow;
        _kit.previewDimension = CGSizeMake(160, 90);
        _kit.streamDimension = CGSizeMake(160, 90);
        _kit.videoFPS = 10;
        _kit.streamerBase.videoMaxBitrate = 32;
        _kit.streamerBase.audiokBPS = 16;
        
        _kit.videoOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    }
    return _kit;
}

@end
