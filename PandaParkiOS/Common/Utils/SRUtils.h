//
//  SRUtils.h
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRUtils : NSObject

+ (void)showUnifyAlert;

+ (void)showDialogWithTitle:(NSString *)title
                    message:(NSString *)message
                 cancelText:(NSString *)cancelText
                confirmText:(NSString *)confirmText
               cancelHandle:(void (^)(void))cancelHandle
              confirmHandle:(void (^)(void))confirmHandle;

@end

NS_ASSUME_NONNULL_END
