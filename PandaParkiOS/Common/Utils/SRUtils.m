//
//  SRUtils.m
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/14.
//

#import "SRUtils.h"

@implementation SRUtils

+ (void)showUnifyAlert
{
    // 底部按钮
    QMUIAlertAction *confirm = [QMUIAlertAction actionWithTitle:@"确认交卷" style:QMUIAlertActionStyleDefault handler:NULL];
    QMUIAlertAction *cancel = [QMUIAlertAction actionWithTitle:@"检查一下" style:QMUIAlertActionStyleDefault handler:NULL];
    
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
    
    [alertController addAction:confirm];
    [alertController addAction:cancel];
    [alertController showWithAnimated:YES];
}

+ (void)showDialogWithTitle:(NSString *)title
                    message:(NSString *)message
                 cancelText:(NSString *)cancelText
                confirmText:(NSString *)confirmText
               cancelHandle:(void (^)(void))cancelHandle
              confirmHandle:(void (^)(void))confirmHandle
{
    QMUIDialogViewController *dialog = [[QMUIDialogViewController alloc] init];
    dialog.cornerRadius = 15;
    dialog.backgroundColor = UIColor.whiteColor;
    dialog.headerViewBackgroundColor = UIColor.whiteColor;
    dialog.headerSeparatorColor = UIColor.whiteColor;
    dialog.titleView.title = title;
    dialog.titleLabelTextColor = UIColorFromRGB(0x333333);
    dialog.titleLabelFont = [UIFont systemFontOfSize:18 weight:UIFontWeightHeavy];
    //设置副标题
//    dialog.titleView.subtitle = @"";
//    dialog.subTitleLabelTextColor = UIColorFromRGB(0x333333);
//    dialog.subTitleLabelFont = [UIFont systemFontOfSize:18 weight:UIFontWeightHeavy];
    if (!title || [title isEqualToString:@""]) {
        dialog.headerViewHeight = 0;
    }
    UIColor *btnTextColor = UIColorFromRGB(0x333333);
    UIFont *btnTextFont = UIFontBoldMake(14);
    dialog.buttonTitleAttributes = @{NSForegroundColorAttributeName: btnTextColor, NSFontAttributeName:btnTextFont};
    dialog.buttonHighlightedBackgroundColor = UIColorFromRGB(0xf7f7f7);
    
//    UIFont *msgFont = [UIFont systemFontOfSize:18 weight:UIFontWeightHeavy];
//    UIFont *msgFont = UIFontBoldMake(18);
    UIFont *msgFont = UIFontMake(18);
    UIColor *msgColor = UIColorFromRGB(0x333333);
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    contentView.backgroundColor = UIColorWhite;
    UILabel *label = [[UILabel alloc] qmui_initWithFont:msgFont textColor:msgColor];
    label.text = message;
    [label sizeToFit];
    label.center = CGPointMake(CGRectGetWidth(contentView.bounds) / 2.0, CGRectGetHeight(contentView.bounds) / 2.0);
    [contentView addSubview:label];
    dialog.contentView = contentView;
    
    [dialog addCancelButtonWithText:cancelText block:^(QMUIDialogViewController *aDialogViewController) {
        if (cancelHandle) {
            cancelHandle();
        }
    }];
    [dialog addSubmitButtonWithText:confirmText block:^(QMUIDialogViewController *aDialogViewController) {
        [aDialogViewController hide];
        if (confirmHandle) {
            confirmHandle();
        }
    }];
    
    [dialog show];
}



@end
