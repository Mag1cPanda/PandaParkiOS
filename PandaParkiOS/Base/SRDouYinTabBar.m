//
//  SRDouYinTabBar.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import "SRDouYinTabBar.h"

static CGFloat const kCenterBtnWidth = 50;

@implementation SRDouYinTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self addSubview:self.indicatorLine];
    [self addSubview:self.centerBtn];
    
    CGFloat tabBarButtonW = ScreenWidth / 5;
    CGFloat tabBarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 重新设置frame
            CGRect frame = CGRectMake(tabBarButtonIndex * tabBarButtonW, 0, tabBarButtonW, 49);
            child.frame = frame;
            // 增加索引
            if (tabBarButtonIndex == 1) {
                tabBarButtonIndex++;
            }
            tabBarButtonIndex++;
        }
    }
    
}

- (void)centerBtnAction:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"issueBtnActionNotification" object:nil];
    
}

- (UIButton *)centerBtn
{
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x = (ScreenWidth-kCenterBtnWidth)/2;
        _centerBtn.frame = CGRectMake(x, 2, kCenterBtnWidth, kCenterBtnWidth);
        [_centerBtn setImage:[UIImage imageNamed:@"tabbar_camera_image_normal"] forState:UIControlStateNormal];
        _centerBtn.adjustsImageWhenHighlighted = false;
        [_centerBtn addTarget:self action:@selector(centerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerBtn;
}

- (UIView *)indicatorLine
{
    if (!_indicatorLine) {
        _indicatorLine = [[UIView alloc]initWithFrame:CGRectMake(1/15.0f*[UIScreen mainScreen].bounds.size.width, iPhoneX?45:40, 1/15.0f*[UIScreen mainScreen].bounds.size.width, 2)];
        _indicatorLine.backgroundColor = UIColor.whiteColor;
        [self addSubview:_indicatorLine];
    }
    return _indicatorLine;
}


@end
