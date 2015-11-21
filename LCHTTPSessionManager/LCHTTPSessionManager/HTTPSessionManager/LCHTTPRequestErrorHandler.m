//
//  LCRequestErrorHandler.m
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "LCHTTPRequestErrorHandler.h"
#import <AFNetworking/AFNetworking.h>
#import <PupaFoundation/PupaFoundation.h>
#import "MBProgressHUD+HintHUD.h"
#import <YAUIKit/YAUIKit.h>

@implementation LCHTTPRequestErrorHandler

#pragma mark- Singleton

+ (LCHTTPRequestErrorHandler *)standardHander
{
    static LCHTTPRequestErrorHandler *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[LCHTTPRequestErrorHandler alloc]init];
    });
    
    return singleton;
    
    
}

#pragma mark-Received

- (void)recivedAFHTTPSessionError:(NSError *)error
{
    NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
 
      NSLog(@"Network Error: %@", error);
    
    NSDictionary *errorObject = errorData ? [NSDictionary dictionaryFromJSONData:errorData]:nil;
    
    if (error.code != -999) {
         __weak typeof(self) weakSelf = self;
        
        switch (error.code) {
            case 403:
            case 408:
            case 411:
            {
                [MBProgressHUD showHUDHint:@"登录失效，请重新登录"
                                    toView:[UIApplication sharedApplication].keyboardWindow
                                  complete:^{ [weakSelf ar_reLogin]; }];
                break;
            }
                break;
                
            default:
                [MBProgressHUD showHUDHint:errorObject ? errorObject[@"error"] : @"网络异常，请检查网络设置"
                                    toView:[UIApplication sharedApplication].keyboardWindow
                                  complete:nil];
                break;
        }
    } else {
         [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyboardWindow animated:NO];
    }
}

- (void)ar_reLogin
{
    //进行登录操作
}


@end
