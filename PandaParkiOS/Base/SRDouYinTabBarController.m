//
//  SRDouYinTabBarController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import "SRDouYinTabBarController.h"
#import "HomeViewController.h"
#import "DynamicViewController.h"
#import "MatchViewController.h"
#import "ChatViewController.h"
#import "MineViewController.h"

@interface SRDouYinTabBarController ()

@end

@implementation SRDouYinTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.douyinTabBar = [SRDouYinTabBar new];
    [self setValue:self.douyinTabBar forKey:@"tabBar"];
    
    
    [self addCustomChildVC:[HomeViewController new] title:@"首页" imageName:nil withSelectedImage:nil];
    [self addCustomChildVC:[DynamicViewController new] title:@"动态"  imageName:nil withSelectedImage:nil];
    [self addCustomChildVC:[ChatViewController new] title:@"消息"  imageName:nil withSelectedImage:nil];
    [self addCustomChildVC:[MineViewController new] title:@"我的"  imageName:nil withSelectedImage:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(presentIssueVC:) name:@"issueBtnActionNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabbarBackgroundViewColor:) name:@"tabbarSelectedIndexNotification" object:nil];
    
    self.douyinTabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    self.tabBar.shadowImage = [UIImage new];
}


- (void)presentIssueVC:(NSNotification *)notification{
    NSLog(@"发布发布发布~~~~");
    
}

- (void)tabbarBackgroundViewColor:(NSNotification *)notification{
    NSDictionary *info = notification.userInfo;
    NSInteger tabBarIndex = [info[@"index"] integerValue];
    ///修改tabBarItem上的indicatorLine的颜色和中心按钮图片
//    self.douyinTabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:1]];
    self.douyinTabBar.backgroundImage = tabBarIndex ? [self imageWithColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:1]] : [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];

    self.tabBar.shadowImage = [UIImage new];
    self.douyinTabBar.indicatorLine.backgroundColor = tabBarIndex ? UIColor.redColor : UIColor.whiteColor;
    [self.douyinTabBar.centerBtn setImage:[UIImage imageNamed:tabBarIndex ? @"tabbar_camera_image_selected" : @"tabbar_camera_image_normal"] forState:UIControlStateNormal];
    ///修改tabBarItem的文字颜色
    [self setTabbarItemtextColorWithIndex:tabBarIndex];
    [self viewDidLayoutSubviews];
}

- (void)addCustomChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName withSelectedImage:(NSString *)selectedImage {
    self.tabBar.tintColor = UIColor.redColor;
    if (imageName) {
        vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    if (selectedImage) {
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:UIColor.whiteColor,NSFontAttributeName:[UIFont systemFontOfSize:15]};
    NSDictionary *textTitleOptionsSelected = @{NSForegroundColorAttributeName:UIColor.whiteColor,NSFontAttributeName:[UIFont systemFontOfSize:15]};
    [nav.tabBarItem setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:textTitleOptionsSelected forState:UIControlStateSelected];
    nav.tabBarItem.title = title;
    self.tabBar.barTintColor = [UIColor whiteColor];
    [self addChildViewController:nav];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -15)];
}

-(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setTabbarItemtextColorWithIndex:(NSInteger)index{
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)vc;
            NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:index?rgba(102, 102, 102, 1):UIColor.whiteColor,NSFontAttributeName:[UIFont systemFontOfSize:15]};
            NSDictionary *textTitleOptionsSelected = @{NSForegroundColorAttributeName:index?UIColor.redColor:UIColor.whiteColor,NSFontAttributeName:[UIFont systemFontOfSize:15]};
            [nav.tabBarItem setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
            [nav.tabBarItem setTitleTextAttributes:textTitleOptionsSelected forState:UIControlStateSelected];
        }
    }
}
@end
