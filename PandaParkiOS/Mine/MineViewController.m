//
//  MineViewController.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/11.
//

#import "MineViewController.h"
#import "MineHeaderView.h"

@interface MineViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) MineHeaderView *headerView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"我的";
    self.view.backgroundColor = RandomColor;
    self.automaticallyAdjustsScrollViewInsets = false;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    //没有约束
    MineHeaderView *headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) type:ZoomHeaderViewTypeNoConstraint];
    //代码约束
//    MineHeaderView *headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) type:ZoomHeaderViewTypeCodeConstraint];
    tableView.tableHeaderView = headerView;
    self.headerView = headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index--%ld",(long)indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    [self.headerView updateHeaderImageViewFrameWithOffsetY:offsetY];
}

@end
