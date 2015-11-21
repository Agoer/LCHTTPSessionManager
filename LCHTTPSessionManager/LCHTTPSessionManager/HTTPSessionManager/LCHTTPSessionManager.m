//
//  LCHTTPSessionManager.m
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "LCHTTPSessionManager.h"

#define JS_API_BASE_URL [NSURL URLWithString:@"http://api.izudian.com/"]

@implementation LCHTTPSessionManager

#pragma mark- singleton
+ (LCHTTPSessionManager *)sharedLCHTTPSessionManager
{
    static LCHTTPSessionManager *singleton = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        sessionConfiguration.timeoutIntervalForRequest = 60.f;
        sessionConfiguration.timeoutIntervalForResource = 60.f;
        sessionConfiguration.allowsCellularAccess = YES;
        singleton = [[LCHTTPSessionManager alloc]initWithBaseURL:JS_API_BASE_URL sessionConfiguration:sessionConfiguration];
    });
    
    [singleton setAccessToken:@"lichan"];
    
    return singleton;
}


#pragma mark- Setter
- (void)setAccessToken:(NSString *)accessToken
{
    [self.requestSerializer setValue:[NSString stringWithFormat:@"bearer %@", accessToken]
                  forHTTPHeaderField:@"Authorization"];
}

#pragma mark- HTTP Request

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *, id))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [super GET:URLString
          parameters:[self lc_requestFinalParamtersWithParamters:parameters]
             success:success
             failure:failure];
    
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *, id))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [super POST:URLString
           parameters:[self lc_requestFinalParamtersWithParamters:parameters]
             success:success
             failure:failure];
    
}

#pragma mark- Util
- (NSDictionary *)lc_requestFinalParamtersWithParamters:(NSDictionary *)parameters
{
    NSMutableDictionary *finalParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    finalParameters[@"api_version"] = @(kLCShareAPICurrentVersion);
    finalParameters[@"platform"] = @"iOS";
    return [finalParameters copy];
    
}




@end
