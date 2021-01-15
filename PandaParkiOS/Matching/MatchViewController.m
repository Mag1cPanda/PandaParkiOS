//
//  MatchViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/11.
//

#import "MatchViewController.h"
#import "SRPageController.h"

@interface MatchViewController ()

@property(nonatomic, strong) SRPageController *pageVC;

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"匹配";
    self.view.backgroundColor = RandomColor;
    
    [self addChildViewController:self.pageVC];
    [self.view addSubview:_pageVC.view];
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
//            make.edges.equalTo(self.view.mas_safeAreaLayoutGuide);

            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.left.right.mas_equalTo(self.view);
        } else {
            // Fallback on earlier versions
            make.edges.mas_equalTo(self.view);
        }
        
        
    }];
    
}




- (WMPageController *)pageVC
{
    if (!_pageVC) {
        _pageVC = [[SRPageController alloc] init];
        _pageVC.menuViewStyle = WMMenuViewStyleLine;
        _pageVC.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        _pageVC.titleSizeSelected = 16;
        _pageVC.titleSizeNormal = 14;
        _pageVC.titleColorSelected = UIColor.redColor;
        _pageVC.titleColorNormal = UIColor.whiteColor;
        _pageVC.progressWidth = 20;
        _pageVC.progressColor = UIColor.whiteColor;
        _pageVC.showOnNavigationBar = true;
        _pageVC.progressViewIsNaughty = true;
    }
    return _pageVC;
}


@end
