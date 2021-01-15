//
//  SRPageController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/15.
//

#import "SRPageController.h"
#import "AttentionViewController.h"
#import "DiscoverViewController.h"

@interface SRPageController ()

@end

@implementation SRPageController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.titleSizeSelected = 16;
        self.titleSizeNormal = 14;
        self.titleColorSelected = UIColor.redColor;
        self.titleColorNormal = UIColor.whiteColor;
        self.progressWidth = 20;
        self.progressColor = UIColor.whiteColor;
//        self.showOnNavigationBar = true;
        self.progressViewIsNaughty = true;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 2;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"关注";
    } else {
        return @"发现";
    }
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index == 0) {
        AttentionViewController *vc = [AttentionViewController new];
        return vc;
    } else {
        DiscoverViewController *vc = [DiscoverViewController new];
        return vc;
    }
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    return CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}



@end
