//
//  ArticleViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/15.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    QMUIButton *btn = [[QMUIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    btn.backgroundColor = RandomColor;
    btn.qmui_tapBlock = ^(__kindof UIControl *sender) {
        [self.navigationController popViewControllerAnimated:true];
    };
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 主动在转场过程中触发布局的重新运算
    [self.view setNeedsLayout];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view setNeedsLayout];
    });
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 主动在转场过程中触发布局的重新运算
    [self.view setNeedsLayout];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view setNeedsLayout];
    });
}

- (void)initSubviews {
    [super initSubviews];
  
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}

- (BOOL)forceEnableInteractivePopGestureRecognizer
{
    return true;
}



@end
