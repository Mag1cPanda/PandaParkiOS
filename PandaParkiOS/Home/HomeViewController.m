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

@interface HomeViewController ()

@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"首页";
    self.view.backgroundColor = RandomColor;
    

//    NSArray *tmpArr = @[@{@"title":@"", @"list":@[]}];
//    self.dataArr = tmpArr.mutableCopy;
    
    //导航栏平滑过渡
    self.dataArr = @[@"矢量动画", @"推拉流", @"评分视图"].mutableCopy;
}

- (void)showCustomAlert
{
    // 底部按钮
    QMUIAlertAction *action1 = [QMUIAlertAction actionWithTitle:@"确认交卷" style:QMUIAlertActionStyleDefault handler:NULL];
    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:@"检查一下" style:QMUIAlertActionStyleDefault handler:NULL];
    
    // 弹窗
    QMUIAlertController *alertController = [[QMUIAlertController alloc] initWithTitle:@"确定删除？" message:@"删除后将无法恢复，请慎重考虑" preferredStyle:QMUIAlertControllerStyleAlert];
    NSMutableDictionary *titleAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertTitleAttributes];
    titleAttributs[NSForegroundColorAttributeName] = UIColor.blackColor;
    alertController.alertTitleAttributes = titleAttributs;
    NSMutableDictionary *messageAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertMessageAttributes];
    messageAttributs[NSForegroundColorAttributeName] = UIColor.blackColor;
    alertController.alertMessageAttributes = messageAttributs;
    alertController.alertHeaderBackgroundColor = UIColorFromRGB(0xf7f7f7);
//    alertController.alertSeparatorColor = UIColorFromRGB(0x09141F);
    alertController.alertTitleMessageSpacing = 7;
    
    NSMutableDictionary *buttonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertButtonAttributes];
    buttonAttributes[NSForegroundColorAttributeName] = UIColorFromRGB(0xFFA200);
    alertController.alertButtonAttributes = buttonAttributes;
    
    NSMutableDictionary *cancelButtonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertCancelButtonAttributes];
    cancelButtonAttributes[NSForegroundColorAttributeName] = UIColorFromRGB(0xFFA200);
    alertController.alertCancelButtonAttributes = cancelButtonAttributes;
    
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController showWithAnimated:YES];
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
    QMUITableViewHeaderFooterView *headerView = (QMUITableViewHeaderFooterView *)[super tableView:tableView viewForHeaderInSection:section];
    QMUIButton *button = (QMUIButton *)headerView.accessoryView;
    if (!button) {
        button = [QDUIHelper generateLightBorderedButton];
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
}

- (void)handleButtonEvent:(UIView *)view {
    // 通过这个方法获取到点击的按钮所处的 sectionHeader，可兼容 sectionHeader 停靠在列表顶部的场景
    NSInteger sectionIndexForView = [self.tableView qmui_indexForSectionHeaderAtView:view];
    if (sectionIndexForView != -1) {
        [QMUITips showWithText:[NSString stringWithFormat:@"点击了 section%@ 上的按钮", @(sectionIndexForView)] inView:self.view hideAfterDelay:1.2];
    } else {
        [QMUITips showError:@"无法定位被点击的按钮所处的 section" inView:self.view hideAfterDelay:1.2];
    }
}

#pragma mark - setter
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


@end
