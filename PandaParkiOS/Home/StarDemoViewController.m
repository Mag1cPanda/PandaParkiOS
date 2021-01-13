//
//  StarDemoViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import "StarDemoViewController.h"
#import "YYStarView.h"

@interface StarDemoViewController ()

@property(nonatomic, strong) YYStarView *starView;

@end

@implementation StarDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评分视图";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithTitle:@"评分" target:self action:@selector(showInModal)];
    
//    [self showInView];
    
    [self showInModal];
}

-(void)showInModal
{
    QMUIAlertAction *cancel = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleDefault handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
        
    }];
    QMUIAlertAction *confirm = [QMUIAlertAction actionWithTitle:@"确定" style:QMUIAlertActionStyleDefault handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
        
    }];
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:QMUIAlertControllerStyleAlert];
    [alertController addAction:confirm];
    [alertController addAction:cancel];
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
//    customView.backgroundColor = UIColor.redColor;
    __weak __typeof(self)weakSelf = self;
    __block CGFloat starScore = 0.f;
    self.starView.starClick = ^ {
        starScore = weakSelf.starView.starScore;
        NSLog(@"%f",weakSelf.starView.starScore);
    };
    [customView addSubview:self.starView];
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(customView);
    }];
//    self.starView.starScore = 3;
    [alertController addCustomView:customView];
    [alertController showWithAnimated:YES];
}

-(void)showInView
{
    YYStarView *starView = [YYStarView new];
    starView.starScore = 2;
    starView.starSize = CGSizeMake(25, 25);
    starView.starSpacing = 15;
    starView.starCount = 7;
    starView.starBrightImageName = @"star_bright";
    starView.starDarkImageName = @"star_dark";
    starView.starClick = ^ {

    };
    [self.view addSubview:starView];
    [starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);//无需设置大小size，只需设置位置即可
        make.top.mas_equalTo(100);
    }];
}

-(YYStarView *)starView
{
    if (!_starView) {
        _starView = [YYStarView new];
        _starView.starSize = CGSizeMake(25, 25);
        _starView.starSpacing = 15;
        _starView.starCount = 5;
        _starView.starBrightImageName = @"star_bright";
        _starView.starDarkImageName = @"star_dark";
    }
    return _starView;
}

@end
