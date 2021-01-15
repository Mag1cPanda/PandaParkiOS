//
//  DynamicViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/11.
//

#import "DynamicViewController.h"
#import "QDNavigationBarMaxYViewController.h"
#import "ArticleViewController.h"

@interface DynamicViewController ()
@property(nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"动态";
    self.view.backgroundColor = RandomColor;
    
    for (NSInteger i=0; i<100; i++) {
        [self.dataArr addObject:@(i)];
    }
}


#pragma mark - <UITableViewDataSource, UITableViewDelegate>

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
    cell.textLabel.text = [NSString qmui_stringWithNSInteger:indexPath.row];
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
//        [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
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
//    QDNavigationBarMaxYViewController *vc = [QDNavigationBarMaxYViewController new];
    ArticleViewController *vc = [ArticleViewController new];
//    vc.navigationBarHidden = YES;
    vc.navigationBarHidden = (indexPath.row%2 == 0);
    [self.navigationController pushViewController:vc animated:true];
    
    if (indexPath.row == 0) {

    }
    else if (indexPath.row == 1) {

    }
    else if (indexPath.row == 2) {

    }
    else if (indexPath.row == 3) {

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
