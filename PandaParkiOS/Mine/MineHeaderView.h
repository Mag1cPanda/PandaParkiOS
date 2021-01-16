//
//  MineHeaderView.h
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZoomHeaderViewType) {
    ZoomHeaderViewTypeNoConstraint,
    ZoomHeaderViewTypeCodeConstraint,
    ZoomHeaderViewTypeXibConstraint,
};

@interface MineHeaderView : UIView

@property (nonatomic, assign) BOOL isNeedNarrow;
- (instancetype)initWithFrame:(CGRect)frame type:(ZoomHeaderViewType)type;
- (void)updateHeaderImageViewFrameWithOffsetY:(CGFloat)offsetY;


@end

NS_ASSUME_NONNULL_END
