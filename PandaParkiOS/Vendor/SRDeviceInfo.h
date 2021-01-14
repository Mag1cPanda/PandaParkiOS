//
//  SRDeviceInfo.h
//  PandaParkiOS
//
//  Created by panshen  on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRDeviceInfo : NSObject

/**
 获取手机的型号
 */
+ (NSString *)getDeviceType;

/**
 获取手机系统版本
 */
+ (NSString *)getSystemVersion;

@end

NS_ASSUME_NONNULL_END
