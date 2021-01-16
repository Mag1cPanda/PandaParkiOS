//
//  SRTableViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/16.
//

#import "SRTableViewController.h"

@interface SRTableViewController ()

@end

@implementation SRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//-(BOOL)preferredNavigationBarHidden
//{
//    return self.navigationBarHidden;
//}

- (BOOL)forceEnableInteractivePopGestureRecognizer
{
    return YES;
}

- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable {
    return YES;
}

@end
