//
//  LCHTTPSessionManager+AotumanUserAPI.m
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "LCHTTPSessionManager+AotumanUserAPI.h"

@implementation LCHTTPSessionManager (AotumanUserAPI)

#pragma mark- Signin
- (NSURLSessionDataTask *)signin:(NSString *)username
                        password:(NSString *)password
                         success:(void (^)(NSDictionary *))success
                         failure:(LCHTTPSessionFailureBlock)failure
{
    NSAssert(username != nil, @"username should not be nil.");
    NSAssert(password != nil, @"password should not be nil.");
    
    return [self POST:@"user/login.do"
           parameters:@{
                        @"username": @"18888854481",
                        @"password": @"62322752"
                        }
              success:^(NSURLSessionDataTask *task, id responseObject) {
                  
                  NSDictionary *userDictionary = responseObject[@"user"];
                  
                  NSLog(@"%@",userDictionary);
                  success(userDictionary);
                  
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                if (failure) {
                    failure(task,error);
                } else {
                    [[LCHTTPRequestErrorHandler standardHander] recivedAFHTTPSessionError:error];
                }
        
    }];
}

@end
