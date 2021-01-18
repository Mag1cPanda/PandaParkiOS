//
//  ShareMenuView.h
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/18.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ShareMenuViewStyleLight,
    ShareMenuViewStyleDark,
} ShareMenuViewStyle;
NS_ASSUME_NONNULL_BEGIN

@protocol ShareMenuViewDelegate <NSObject>

@optional

@end

@interface ShareMenuView : UIView

@property(nonatomic, strong) UIImageView *adView;

@property(nonatomic, strong) UILabel *titleLbl;

@property(nonatomic, strong) UIView *contentView;

@property(nonatomic, strong) UIButton *cancelBtn;

@property(nonatomic, assign) ShareMenuViewStyle style;
@property(nonatomic, assign) BOOL showAD;

@property (nonatomic, copy) void (^didClickCancel)(void);

- (instancetype)initWithStyle:(ShareMenuViewStyle)style showADView:(BOOL)showAD;

@end

NS_ASSUME_NONNULL_END
