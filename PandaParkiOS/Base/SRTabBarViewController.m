//
//  SRTabBarViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/12.
//

#import "SRTabBarViewController.h"
#import "SRNavigationController.h"
#import "HomeViewController.h"
#import "DynamicViewController.h"
#import "MatchViewController.h"
#import "ChatViewController.h"
#import "MineViewController.h"
#import <Lottie/Lottie.h>
#import <YYCategories.h>

static NSString* const kHomeText = @"首页";
static NSString* const kDynamicText = @"动态";
static NSString* const kMatchText = @"匹配";
static NSString* const kChatText = @"聊天";
static NSString* const kMineText = @"我的";

static NSString* const kSelectedTextColor = @"#333333";
static NSString* const kDefaultTextColor = @"#FFAB1A";

@interface SRTabBarViewController ()

//@property (nonatomic, strong) LOTAnimationView *lottieHome;
//@property (nonatomic, strong) UILabel *labelHome;
//
//@property (nonatomic, strong) LOTAnimationView *lottieDynamic;
//@property (nonatomic, strong) UILabel *labelDynamic;
//
//@property (nonatomic, strong) LOTAnimationView *lottieMatch;
//@property (nonatomic, strong) UILabel *labelMatch;
//
//@property (nonatomic, strong) LOTAnimationView *lottieNewStudy;
//@property (nonatomic, strong) UILabel *labelNewStudy;
//
//@property (nonatomic, strong) LOTAnimationView *lottieMine;
//@property (nonatomic, strong) UILabel *labelMine;

@property (nonatomic, strong) LOTAnimationView *lottieHome;
@property (nonatomic, strong) UILabel *labelHome;

@property (nonatomic, strong) LOTAnimationView *lottieCircle;
@property (nonatomic, strong) UILabel *labelCircle;

@property (nonatomic, strong) LOTAnimationView *lottieLearn;
@property (nonatomic, strong) UILabel *labelLearn;

@property (nonatomic, strong) LOTAnimationView *lottieNewStudy;
@property (nonatomic, strong) UILabel *labelNewStudy;

@property (nonatomic, strong) LOTAnimationView *lottieMine;
@property (nonatomic, strong) UILabel *labelMine;

@end

@implementation SRTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeVC = [HomeViewController new];
    homeVC.title = kHomeText;
    homeVC.hidesBottomBarWhenPushed = false;
//    homeVC.navigationBarHidden = true;
    SRNavigationController *homeNav = [[SRNavigationController alloc] initWithRootViewController:homeVC];
    
    DynamicViewController *dynamicVC = [DynamicViewController new];
    dynamicVC.hidesBottomBarWhenPushed = false;
    dynamicVC.title = kDynamicText;
    SRNavigationController *dynamicNav = [[SRNavigationController alloc] initWithRootViewController:dynamicVC];
    
    MatchViewController *matchVC = [MatchViewController new];
    matchVC.hidesBottomBarWhenPushed = false;
    matchVC.title = kMatchText;
//    matchVC.navigationBarHidden = true;
    SRNavigationController *matchNav = [[SRNavigationController alloc] initWithRootViewController:matchVC];
    
    ChatViewController *chatVC = [ChatViewController new];
    chatVC.hidesBottomBarWhenPushed =false;
    chatVC.title = kChatText;
    SRNavigationController *chatNav = [[SRNavigationController alloc] initWithRootViewController:chatVC];
    
    MineViewController *mineVC = [MineViewController new];
//    mineVC.navigationBarHidden = true;
    mineVC.hidesBottomBarWhenPushed = false;
    mineVC.title = kMineText;
    SRNavigationController *mineNav = [[SRNavigationController alloc] initWithRootViewController:mineVC];
    
    self.viewControllers = @[homeNav, dynamicNav, matchNav, chatNav, mineNav];
    
    [[UITabBar appearance] setTintColor:KButtonMainColor];
    
    CGFloat tabBar_y = -1;
    CGFloat tabBar_w = self.tabBar.width/5.0;
    CGFloat tabBar_h = self.tabBar.height+1;
    UIView *homeView = [[UIView alloc] initWithFrame:CGRectMake(0, tabBar_y, tabBar_w, tabBar_h)];
    homeView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    homeView.tag = 0;
    [self.tabBar addSubview:homeView];
    UITapGestureRecognizer *homeViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarClick:)];
    [homeView addGestureRecognizer:homeViewTap];
    self.lottieHome = [LOTAnimationView animationNamed:@"SHOUYE"];
    self.lottieHome.frame = CGRectMake((tabBar_w-20)*0.5-0.5, 10, 20, 21);
    [homeView addSubview:self.lottieHome];
    [self.lottieHome play];
    self.labelHome = [[UILabel alloc] initWithFrame:CGRectMake(0, self.lottieHome.bottom+1, tabBar_w, 14)];
    self.labelHome.text = kHomeText;
    self.labelHome.textColor = UIColorFromRGB(0xFFAB1A);
    self.labelHome.font = kFont(10);
    self.labelHome.textAlignment = NSTextAlignmentCenter;
    [homeView addSubview:self.labelHome];
    
    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(tabBar_w, tabBar_y, tabBar_w, tabBar_h)];
    circleView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    circleView.tag = 1;
    [self.tabBar addSubview:circleView];
    UITapGestureRecognizer *circleViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarClick:)];
    [circleView addGestureRecognizer:circleViewTap];
    self.lottieCircle = [LOTAnimationView animationNamed:@"QUANZI"];
    self.lottieCircle.frame = CGRectMake((tabBar_w-20)*0.5-0.5, 10, 20, 21);
    [circleView addSubview:self.lottieCircle];
    self.labelCircle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.lottieCircle.bottom+1, tabBar_w, 14)];
    self.labelCircle.text = kDynamicText;
    self.labelCircle.textColor = kFontColor;
    self.labelCircle.font = kFont(10);
    self.labelCircle.textAlignment = NSTextAlignmentCenter;
    [circleView addSubview:self.labelCircle];
    
    UIView *learnView = [[UIView alloc] initWithFrame:CGRectMake(tabBar_w*2, tabBar_y, tabBar_w, tabBar_h)];
    learnView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    learnView.tag = 2;
    [self.tabBar addSubview:learnView];
    UITapGestureRecognizer *learnViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarClick:)];
    [learnView addGestureRecognizer:learnViewTap];
    self.lottieLearn = [LOTAnimationView animationNamed:@"XUEXI"];
    self.lottieLearn.frame = CGRectMake((tabBar_w-20)*0.5-0.5, 10, 20, 21);
    [learnView addSubview:self.lottieLearn];
    self.labelLearn = [[UILabel alloc] initWithFrame:CGRectMake(0, self.lottieLearn.bottom+1, tabBar_w, 14)];
    self.labelLearn.text = kMatchText;
    self.labelLearn.textColor = kFontColor;
    self.labelLearn.font = kFont(10);
    self.labelLearn.textAlignment = NSTextAlignmentCenter;
    [learnView addSubview:self.labelLearn];
    
    UIView *newStudyView = [[UIView alloc] initWithFrame:CGRectMake(tabBar_w*3, tabBar_y, tabBar_w, tabBar_h)];
    newStudyView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    newStudyView.tag = 3;
    [self.tabBar addSubview:newStudyView];
    UITapGestureRecognizer *newStudyViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarClick:)];
    [newStudyView addGestureRecognizer:newStudyViewTap];
    self.lottieNewStudy = [LOTAnimationView animationNamed:@"TIKU"];
    self.lottieNewStudy.frame = CGRectMake((tabBar_w-20)*0.5-0.5, 10, 20, 21);
    [newStudyView addSubview:self.lottieNewStudy];
    self.labelNewStudy = [[UILabel alloc] initWithFrame:CGRectMake(0, self.lottieNewStudy.bottom+1, tabBar_w, 14)];
    self.labelNewStudy.text = kChatText;
    self.labelNewStudy.textColor = kFontColor;
    self.labelNewStudy.font = kFont(10);
    self.labelNewStudy.textAlignment = NSTextAlignmentCenter;
    [newStudyView addSubview:self.labelNewStudy];
    
    UIView *mineView = [[UIView alloc] initWithFrame:CGRectMake(tabBar_w*4, tabBar_y, tabBar_w, tabBar_h)];
    mineView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    mineView.tag = 4;
    [self.tabBar addSubview:mineView];
    UITapGestureRecognizer *mineViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarClick:)];
    [mineView addGestureRecognizer:mineViewTap];
    self.lottieMine = [LOTAnimationView animationNamed:@"WODE"];
    self.lottieMine.frame = CGRectMake((tabBar_w-20)*0.5-0.5, 10, 20, 21);
    [mineView addSubview:self.lottieMine];
    self.labelMine = [[UILabel alloc] initWithFrame:CGRectMake(0, self.lottieMine.bottom+1, tabBar_w, 14)];
    self.labelMine.text = kMineText;
    self.labelMine.textColor = kFontColor;
    self.labelMine.font = kFont(10);
    self.labelMine.textAlignment = NSTextAlignmentCenter;
    [mineView addSubview:self.labelMine];
}

#pragma mark - tabBar点击
- (void)tabBarClick:(UITapGestureRecognizer *)tap
{
    UIView *view = (UIView *)tap.view;
    self.selectedIndex = view.tag;
    if (view.tag == 0) {
        [self.lottieHome play];
        [self.lottieCircle stop];
        [self.lottieLearn stop];
        [self.lottieNewStudy stop];
        [self.lottieMine stop];
        self.labelHome.textColor = UIColorFromRGB(0xFFAB1A);
        self.labelCircle.textColor = kFontColor;
        self.labelLearn.textColor = kFontColor;
        self.labelNewStudy.textColor = kFontColor;
        self.labelMine.textColor = kFontColor;
    } else if (view.tag == 1) {
        [self.lottieHome stop];
        [self.lottieCircle play];
        [self.lottieLearn stop];
        [self.lottieNewStudy stop];
        [self.lottieMine stop];
        self.labelHome.textColor = kFontColor;
        self.labelCircle.textColor = UIColorFromRGB(0xFFAB1A);
        self.labelLearn.textColor = kFontColor;
        self.labelNewStudy.textColor = kFontColor;
        self.labelMine.textColor = kFontColor;
    } else if (view.tag == 2) {
        [self.lottieHome stop];
        [self.lottieCircle stop];
        [self.lottieLearn play];
        [self.lottieNewStudy stop];
        [self.lottieMine stop];
        self.labelHome.textColor = kFontColor;
        self.labelCircle.textColor = kFontColor;
        self.labelLearn.textColor = UIColorFromRGB(0xFFAB1A);
        self.labelNewStudy.textColor = kFontColor;
        self.labelMine.textColor = kFontColor;
    } else if (view.tag == 3) {
        [self.lottieHome stop];
        [self.lottieCircle stop];
        [self.lottieLearn stop];
        [self.lottieNewStudy play];
        [self.lottieMine stop];
        self.labelHome.textColor = kFontColor;
        self.labelCircle.textColor = kFontColor;
        self.labelLearn.textColor = kFontColor;
        self.labelNewStudy.textColor = UIColorFromRGB(0xFFAB1A);
        self.labelMine.textColor = kFontColor;
    } else if (view.tag == 4) {
        [self.lottieHome stop];
        [self.lottieCircle stop];
        [self.lottieLearn stop];
        [self.lottieNewStudy stop];
        [self.lottieMine play];
        self.labelHome.textColor = kFontColor;
        self.labelCircle.textColor = kFontColor;
        self.labelLearn.textColor = kFontColor;
        self.labelNewStudy.textColor = kFontColor;
        self.labelMine.textColor = UIColorFromRGB(0xFFAB1A);
    }
}


@end
