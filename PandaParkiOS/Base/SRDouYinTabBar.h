//
//  SRDouYinTabBar.h
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/13.
//

#import <UIKit/UIKit.h>

#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define randomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f]
#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

NS_ASSUME_NONNULL_BEGIN

@interface SRDouYinTabBar : UITabBar

@property(nonatomic, strong) UIView *indicatorLine;
@property(nonatomic, strong) UIButton *centerBtn;

@end

NS_ASSUME_NONNULL_END
