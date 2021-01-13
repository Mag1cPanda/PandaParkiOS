//
//  AppDelegate.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/11.
//

#import "AppDelegate.h"
#import <DoraemonKit/DoraemonManager.h>
#import "YYFPSLabel.h"
#import <RTMPCHybirdEngine/ARRtmpSDK.h>

#import "SRTabBarViewController.h"
#import "SRNavigationController.h"
#import "SRDouYinTabBarController.h"
#import "LXYDouYinTabBarController.h"

#import "HomeViewController.h"
#import "DynamicViewController.h"
#import "MatchViewController.h"
#import "ChatViewController.h"
#import "MineViewController.h"

#import "QDUIKitViewController.h"
#import "QDComponentsViewController.h"
#import "QDLabViewController.h"

#import "QDUIHelper.h"
#import "QDCommonUI.h"
#import "QMUIConfigurationTemplateGrapefruit.h"
#import "QMUIConfigurationTemplateGrass.h"
#import "QMUIConfigurationTemplatePinkRose.h"
#import "QMUIConfigurationTemplateDark.h"

@interface AppDelegate ()
<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [ARRtmpEngine initEngine:@"939feda8f5e918119837d24b612b4755" token:@""];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeDidChangeNotification:) name:QMUIThemeDidChangeNotification object:nil];
    
    [[DoraemonManager shareInstance] installWithPid:@"ac608fbbbd20789a82e174feafd29e5d"];
    
    self.window = [[UIWindow alloc] init];
    [self didInitWindow];
    
    [self.window addSubview:[[YYFPSLabel alloc] initWithFrame:CGRectMake(20, 20, 0, 0)]];
    
    
    return YES;
}

- (void)didInitWindow {
    
    
    //普通TabBar
    self.window.rootViewController = [SRTabBarViewController new];
    
    //抖音、小红书TabBar
//    SRDouYinTabBarController *tabBarCtrl = [[SRDouYinTabBarController alloc] init];
//    LXYDouYinTabBarController *tabBarCtrl = [[LXYDouYinTabBarController alloc] init];
//    tabBarCtrl.delegate = self;
//    self.window.rootViewController = tabBarCtrl;
    
    //QMUI Demo
//    self.window.rootViewController = [self generateQMUIDemo];
    [self.window makeKeyAndVisible];
//    [self startLaunchingAnimation];
}

- (UIViewController *)generateQMUIDemo {
    QMUITabBarViewController *tabBarViewController = [QMUITabBarViewController new];
    
    // QMUIKit
    QDUIKitViewController *uikitViewController = [[QDUIKitViewController alloc] init];
    uikitViewController.hidesBottomBarWhenPushed = NO;
    QMUINavigationController *uikitNavController = [[QMUINavigationController alloc] initWithRootViewController:uikitViewController];
    uikitNavController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"QMUIKit" image:UIImageMake(@"icon_tabbar_uikit") selectedImage:UIImageMake(@"icon_tabbar_uikit_selected") tag:0];
    AddAccessibilityHint(uikitNavController.tabBarItem, @"展示一系列对系统原生控件的拓展的能力");
    
    // UIComponents
    QDComponentsViewController *componentViewController = [[QDComponentsViewController alloc] init];
    componentViewController.hidesBottomBarWhenPushed = NO;
    QMUINavigationController *componentNavController = [[QMUINavigationController alloc] initWithRootViewController:componentViewController];
    componentNavController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"Components" image:UIImageMake(@"icon_tabbar_component") selectedImage:UIImageMake(@"icon_tabbar_component_selected") tag:1];
    AddAccessibilityHint(componentNavController.tabBarItem, @"展示 QMUI 自己的组件库");
    
    // Lab
    QDLabViewController *labViewController = [[QDLabViewController alloc] init];
    labViewController.hidesBottomBarWhenPushed = NO;
    QMUINavigationController *labNavController = [[QMUINavigationController alloc] initWithRootViewController:labViewController];
    labNavController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"Lab" image:UIImageMake(@"icon_tabbar_lab") selectedImage:UIImageMake(@"icon_tabbar_lab_selected") tag:2];
    AddAccessibilityHint(labNavController.tabBarItem, @"集合一些非正式但可能很有用的小功能");
    
    // window root controller
    tabBarViewController.viewControllers = @[uikitNavController, componentNavController, labNavController];
    return tabBarViewController;
}

- (void)startLaunchingAnimation {
    UIWindow *window = self.window;
    
    UIView *launchScreenView = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateInitialViewController].view;
//    UIView *launchScreenView = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil].firstObject;
    launchScreenView.frame = window.bounds;
    [window addSubview:launchScreenView];
    
    UIImageView *backgroundImageView = launchScreenView.subviews[0];
    backgroundImageView.clipsToBounds = YES;
    
    UIImageView *logoImageView = launchScreenView.subviews[1];
    UILabel *copyrightLabel = launchScreenView.subviews.lastObject;
    
    UIView *maskView = [[UIView alloc] initWithFrame:launchScreenView.bounds];
    maskView.backgroundColor = UIColorWhite;
    [launchScreenView insertSubview:maskView belowSubview:backgroundImageView];
    
    [launchScreenView layoutIfNeeded];
    
    
    [launchScreenView.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.identifier isEqualToString:@"bottomAlign"]) {
            obj.active = NO;
            [NSLayoutConstraint constraintWithItem:backgroundImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:launchScreenView attribute:NSLayoutAttributeTop multiplier:1 constant:NavigationContentTop].active = YES;
            *stop = YES;
        }
    }];
    
    [UIView animateWithDuration:.15 delay:0.9 options:QMUIViewAnimationOptionsCurveOut animations:^{
        [launchScreenView layoutIfNeeded];
        logoImageView.alpha = 0.0;
        copyrightLabel.alpha = 0;
    } completion:nil];
    [UIView animateWithDuration:1.2 delay:0.9 options:UIViewAnimationOptionCurveEaseOut animations:^{
        maskView.alpha = 0;
        backgroundImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [launchScreenView removeFromSuperview];
    }];
}

- (void)handleThemeDidChangeNotification:(NSNotification *)notification {
    
    QMUIThemeManager *manager = notification.object;
    if (![manager.name isEqual:QMUIThemeManagerNameDefault]) return;
    
    [[NSUserDefaults standardUserDefaults] setObject:manager.currentThemeIdentifier forKey:QDSelectedThemeIdentifier];
    
    [QDThemeManager.currentTheme applyConfigurationTemplate];
    
    // 主题发生变化，在这里更新全局 UI 控件的 appearance
    [QDCommonUI renderGlobalAppearances];
    
    // 更新表情 icon 的颜色
    [QDUIHelper updateEmotionImages];
}


///这里当你需要登录才能点进这个VC的时候可以在这个方法里处理逻辑
//- (BOOL) shouldxxxx，是否允许做某个操作。
//- (void) willxxx，将要做某个操作。
//- (void) didxxx，完成某个操作。
//是否允许选中某个 viewController。
//YES，允许选中，NO，不允许选中。
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //viewController 为 tabBarController 中 viewControllers 数组中的对象。
//    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
//    if (!isLogin) {
//        if (index == 2 || index == 3) {
//            Class class = NSClassFromString(@"PSLoginAndRegisterViewController");
//            [tabBarController.selectedViewController presentViewController:[class new] animated:YES completion:nil];
//            return NO;
//        }
//    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //判断，然后让第一个页面刷新。
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"index------>>>%ld",index);
    
    //这里是为了动态修改tabbar的背景色
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tabbarSelectedIndexNotification" object:nil userInfo:@{@"index":@(index)}];
    
//    SRDouYinTabBarController *tabbar_c = (SRDouYinTabBarController *)tabBarController;
    LXYDouYinTabBarController *tabbar_c = (LXYDouYinTabBarController *)tabBarController;
    
    CGRect frame = tabbar_c.douyinTabBar.indicatorLine.frame;
    if (index == 0) {
        frame.origin.x = 1/15.0f*[UIScreen mainScreen].bounds.size.width;
    }else if (index == 1){
        frame.origin.x = 4/15.0f*[UIScreen mainScreen].bounds.size.width;
    }else if (index == 2){
        frame.origin.x = 10/15.0f*[UIScreen mainScreen].bounds.size.width;
    }else if (index == 3){
        frame.origin.x = 13/15.0f*[UIScreen mainScreen].bounds.size.width;
    }
    tabbar_c.douyinTabBar.indicatorLine.frame = frame;
}


@end
