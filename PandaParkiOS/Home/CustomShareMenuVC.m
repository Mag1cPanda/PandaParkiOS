//
//  CustomShareMenuVC.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/18.
//

#import "CustomShareMenuVC.h"
#import <zhPopupController.h>
#import "ShareMenuView.h"

@interface CustomShareMenuVC ()
@property(nonatomic, strong) zhPopupController *popC;
@end

@implementation CustomShareMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithTitle:@"显示" target:self action:@selector(showTest)];
}

-(void)showTest
{
    [self.popC showInView:self.view.window completion:nil];
//    [self.popC showInView:self.view.window duration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut bounced:NO completion:nil];
}

- (zhPopupController *)popC
{
    if (!_popC) {
        ShareMenuView *menu = [[ShareMenuView alloc] initWithStyle:ShareMenuViewStyleDark showADView:YES];
//        ShareMenuView *menu = [[ShareMenuView alloc] initWithStyle:ShareMenuViewStyleLight showADView:NO];
        __weak __typeof(self)weakSelf = self;
        menu.didClickCancel = ^{
            [weakSelf.popC dismiss];
        };
        _popC = [[zhPopupController alloc] initWithView:menu size:menu.bounds.size];
        _popC.layoutType = zhPopupLayoutTypeBottom;
        _popC.presentationStyle = zhPopupSlideStyleFromBottom;
    }
    return _popC;
}



@end
