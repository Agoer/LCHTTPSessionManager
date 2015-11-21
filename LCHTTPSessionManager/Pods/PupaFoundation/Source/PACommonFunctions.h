//
//  PACommonFunctions.h
//  PupaDemo
//
//  Created by liuyan on 14-4-17.
//  Copyright (c) 2014年 Douban.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef PupaDemo_PACommonFunctions_h
#define PupaDemo_PACommonFunctions_h

#ifndef PALocalString
#define PALocalString(__KEY) NSLocalizedString(__KEY, nil)
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
#ifndef IF_IOS7_OR_GREATER
#define IF_IOS7_OR_GREATER(...)                                                                                        \
    if (kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1) {                                     \
        __VA_ARGS__                                                                                                    \
    }
#endif
#else
#ifndef IF_IOS7_OR_GREATER
#define IF_IOS7_OR_GREATER(...)
#endif
#endif

#ifndef dispatch_main_sync_safe
#define dispatch_main_sync_safe(block)                                                                                 \
    if ([NSThread isMainThread]) {                                                                                     \
        block();                                                                                                       \
    } else {                                                                                                           \
        dispatch_sync(dispatch_get_main_queue(), block);                                                               \
    }
#endif

#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)                                                                                \
    if ([NSThread isMainThread]) {                                                                                     \
        block();                                                                                                       \
    } else {                                                                                                           \
        dispatch_async(dispatch_get_main_queue(), block);                                                              \
    }
#endif

extern CGPoint PA2DPointMakeWith1DPoint(NSUInteger point, NSUInteger countPerRow);
extern NSUInteger PA1DPointWith2DPoint(CGPoint point, NSUInteger countPerRow);

#endif
