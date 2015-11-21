//
//  LCHTTPSessionManager.h
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "LCHTTPRequestErrorHandler.h"

static NSUInteger const kLCShareAPICurrentVersion = 3;

typedef void(^LCHTTPSessionSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void(^LCHTTPSessionFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface LCHTTPSessionManager : AFHTTPSessionManager

+ (LCHTTPSessionManager *)sharedLCHTTPSessionManager;

- (void)setAccessToken:(NSString *)accessToken;

@end
