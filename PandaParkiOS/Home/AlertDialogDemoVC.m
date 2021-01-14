//
//  AlertDialogDemoVC.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/14.
//

#import "AlertDialogDemoVC.h"
#import "SRUtils.h"

@interface AlertDialogDemoVC ()

@end

@implementation AlertDialogDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithTitle:@"显示" target:self action:@selector(showTest)];
}

-(void)showTest
{
    [SRUtils showDialogWithTitle:@"" message:@"真人认证后才能提现" cancelText:@"取消" confirmText:@"去认证" cancelHandle:^{
        NSLog(@"cancel");
    } confirmHandle:^{
        NSLog(@"confirm");
    }];
}



@end
