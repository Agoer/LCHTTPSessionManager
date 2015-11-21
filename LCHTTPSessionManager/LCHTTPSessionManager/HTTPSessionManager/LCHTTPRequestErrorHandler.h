//
//  LCRequestErrorHandler.h
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHTTPRequestErrorHandler : NSObject

+ (LCHTTPRequestErrorHandler *)standardHander;

- (void)recivedAFHTTPSessionError:(NSError *)error;

@end
