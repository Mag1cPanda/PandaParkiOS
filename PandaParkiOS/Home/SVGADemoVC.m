//
//  SVGADemoVC.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import "SVGADemoVC.h"
#import <SVGA.h>

@interface SVGADemoVC ()<SVGAPlayerDelegate>

@end

@implementation SVGADemoVC

static SVGAParser *parser;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"矢量动画";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithTitle:@"播放" target:self action:@selector(handleRightEvent)];
    
    [self handleRightEvent];
}

-(void)handleRightEvent
{
    SVGAPlayer *player = [SVGAPlayer new];
//    player.backgroundColor = UIColor.redColor;
    player.loops = 1;
    player.delegate = self;
    player.clearsAfterStop = true;
    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    [window addSubview:player];
    [player mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(window);
        make.width.height.mas_equalTo(300);
    }];
    
    SVGAParser *parser = [[SVGAParser alloc] init];
//    __weak __typeof(self)weakSelf = self;
    //从应用包中加载动画
    //kingset Goddess posche heartbeat Rocket rose
    NSArray *arr = @[@"kingset", @"Goddess", @"Posche", @"heartbeat", @"Rocket", @"rose"];
    NSInteger index = arc4random() % arr.count;
    NSString *name = arr[index];
    [parser parseWithNamed:name inBundle:nil completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
        if (videoItem) {
            player.videoItem = videoItem;
            [player startAnimation];
        }
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];;
    
    //从url加载
//    [parser parseWithURL:[NSURL URLWithString:@"https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true"] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//        if (videoItem) {
//            weakSelf.player.videoItem = videoItem;
//        }
//    } failureBlock:nil];
    
//    NSAttributedString *text = [[NSAttributedString alloc] initWithString:@"Pony send Kitty flowers."
//                                                                attributes:@{
//                                                                            NSForegroundColorAttributeName: [UIColor whiteColor],
//                                                                            NSFontAttributeName: [UIFont boldSystemFontOfSize:28.0],
//                                                                            }];
//    [player setAttributedText:text forKey:@"banner"];
}

#pragma mark - SVGADelegate
- (void)svgaPlayerDidFinishedAnimation:(SVGAPlayer *)player {
    [player removeFromSuperview];
}


@end
