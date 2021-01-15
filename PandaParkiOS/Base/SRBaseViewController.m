//
//  SRBaseViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/14.
//

#import "SRBaseViewController.h"

@interface SRBaseViewController ()

@end

@implementation SRBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)preferredNavigationBarHidden
{
    return self.navigationBarHidden;
}

- (BOOL)forceEnableInteractivePopGestureRecognizer
{
    return YES;
}

- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable {
    return YES;
}


@end
