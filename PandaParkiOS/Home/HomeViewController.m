//
//  HomeViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/11.
//

#import "HomeViewController.h"
#import "SVGADemoVC.h"
#import "RTMPDemoViewController.h"
#import "StarDemoViewController.h"
#import "AlertDialogDemoVC.h"
#import <SDCycleScrollView.h>

@interface HomeViewController ()
<SDCycleScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"首页";
    self.view.backgroundColor = RandomColor;
    self.automaticallyAdjustsScrollViewInsets = false;

//    NSArray *tmpArr = @[@{@"title":@"", @"list":@[]}];
//    self.dataArr = tmpArr.mutableCopy;
    
    
    self.dataArr = @[@"矢量动画", @"推拉流", @"评分视图", @"自定义弹窗"].mutableCopy;
    
    NSArray *imagesURLStrings = @[
                           @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                           @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                           @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                           ];
    
//    NSArray *titles = @[@"新建交流QQ群：185534916 ",
//                        @"disableScrollGesture可以设置禁止拖动",
//                        @"感谢您的支持，如果下载的",
//                        @"如果代码在使用过程中出现问题",
//                        @"您可以发邮件到gsdios@126.com"
//                        ];
//    UIImage *img = [UIImage imageNamed:@""];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -StatusBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarHeight+StatusBarHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsZero;
    self.tableView.contentOffset = CGPointMake(0, 0);
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    SDCycleScrollView *banner = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:nil];
    banner.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    banner.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    banner.imageURLStringsGroup = imagesURLStrings;
//    banner.titlesGroup = titles;
//    [self.view addSubview:banner];
    self.tableView.tableHeaderView = banner;
}

-(BOOL)preferredNavigationBarHidden
{
    return YES;
}



/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 10;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    QMUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[QMUITableViewCell alloc] initForTableView:tableView withReuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    cell.textLabel.text = [NSString qmui_stringWithNSInteger:indexPath.row];
    cell.textLabel.text = self.dataArr[indexPath.row];
    [cell updateCellAppearanceWithIndexPath:indexPath];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section%@", @(section)];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    QMUITableViewHeaderFooterView *headerView = (QMUITableViewHeaderFooterView *)[super tableView:tableView viewForHeaderInSection:section];
    QMUITableViewHeaderFooterView *headerView = [QMUITableViewHeaderFooterView new];
    QMUIButton *button = (QMUIButton *)headerView.accessoryView;
    if (!button) {
        button = [QDUIHelper generateLightBorderedButton];
        button.tag = 100 + section;
        [button setTitle:@"Button" forState:UIControlStateNormal];
        button.titleLabel.font = UIFontMake(14);
        button.contentEdgeInsets = UIEdgeInsetsMake(4, 12, 4, 12);
        [button sizeToFit];
        button.qmui_automaticallyAdjustTouchHighlightedInScrollView = YES;
        button.qmui_outsideEdge = UIEdgeInsetsMake(-8, -8, -8, -8);
        [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        headerView.accessoryView = button;
    }
    return headerView;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 100;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section:%zi row:%zi",indexPath.section, indexPath.row);
//    [self showCustomAlert];
    if (indexPath.row == 0) {
        SVGADemoVC *vc = [SVGADemoVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        RTMPDemoViewController *vc = [RTMPDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
        StarDemoViewController *vc = [StarDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3) {
        AlertDialogDemoVC *vc = [AlertDialogDemoVC new];
//        vc.navigationBarHidden = false;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)handleButtonEvent:(UIView *)view {
    // 通过这个方法获取到点击的按钮所处的 sectionHeader，可兼容 sectionHeader 停靠在列表顶部的场景
//    NSInteger sectionIndexForView = [self.tableView qmui_indexForSectionHeaderAtView:view];
    NSInteger sectionIndexForView = view.tag - 100;
    if (sectionIndexForView != -1) {
        [QMUITips showWithText:[NSString stringWithFormat:@"点击了 section%@ 上的按钮", @(sectionIndexForView)] inView:self.view hideAfterDelay:1.2];
    } else {
        [QMUITips showError:@"无法定位被点击的按钮所处的 section" inView:self.view hideAfterDelay:1.2];
    }
}

#pragma mark - getter
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


@end
