//
//  ShareMenuView.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/18.
//

#import "ShareMenuView.h"

@implementation ShareMenuView


- (instancetype)initWithStyle:(ShareMenuViewStyle)style showADView:(BOOL)showAD
{
    self = [super init];
    if (self) {
        self.showAD = showAD;
        self.style = style;
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    CGFloat adHeight = 0;
    if (self.showAD) {
        adHeight = 100;
    }
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 180+adHeight);
    UIColor *textColor = nil;
    if (self.style == ShareMenuViewStyleLight) {
        self.backgroundColor = UIColor.whiteColor;
        textColor = UIColorFromRGB(0x333333);
    } else {
        self.backgroundColor = UIColor.blackColor;
        textColor = UIColor.whiteColor;
    }
    
    self.adView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adHeight)];
    self.adView.image = [UIImage imageNamed:@"组 721"];
//    self.adView.backgroundColor = UIColor.redColor;
    [self addSubview:self.adView];

    
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0+adHeight, SCREEN_WIDTH, 50)];
    self.titleLbl.text = @"分享至";
    self.titleLbl.textColor = textColor;
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.font = [UIFont boldSystemFontOfSize:12];
    [self addSubview:self.titleLbl];
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 50+adHeight, SCREEN_WIDTH, 80)];
    [self addSubview:self.contentView];
      
    NSInteger itemCount = 5;
    
    CGFloat itemW = 44;
    CGFloat itemH = 60;
    CGFloat space = (SCREEN_WIDTH-itemW*itemCount)/(itemCount+1);
//    CGFloat y = 20;
    NSArray *imageArr = @[@"组 423", @"组 426", @"组 430", @"组 433", @"组 437"];
    NSArray *titleArr = @[@"朋友圈", @"微信好友", @"QQ空间", @"QQ好友", @"微博"];
    for (NSInteger i=0; i<itemCount; i++) {
        QMUIButton *btn = [[QMUIButton alloc] initWithFrame:CGRectMake(space+(space+itemW)*i, 0, itemW, itemH)];
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:0];
        [btn setTitle:titleArr[i] forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [btn setTitleColor:textColor forState:0];
        btn.imagePosition = QMUIButtonImagePositionTop;
        btn.spacingBetweenImageAndTitle = 5;
        [self.contentView addSubview:btn];
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, self.contentView.qmui_height-1, SCREEN_WIDTH-30, 0.5)];
    line.backgroundColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:line];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.frame = CGRectMake(0, 130+adHeight, SCREEN_WIDTH, 50);
    [self.cancelBtn setTitle:@"取消" forState:0];
    [self.cancelBtn setTitleColor:textColor forState:0];
    
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:1<<6];
    [self addSubview:self.cancelBtn];
}


//- (void)setStyle:(ShareMenuViewStyle)style
//{
//    if (self.style == ShareMenuViewStyleLight) {
//
//        [self.cancelBtn setTitleColor:UIColorFromRGB(0x333333) forState:0];
//    } else {
//        self.titleLbl.textColor = UIColor.whiteColor;
//        [self.cancelBtn setTitleColor:UIColor.whiteColor forState:0];
//    }
//}

-(void)cancelBtnClick
{
    self.didClickCancel();
}

@end
