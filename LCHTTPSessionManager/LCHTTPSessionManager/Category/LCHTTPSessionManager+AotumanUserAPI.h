//
//  LCHTTPSessionManager+AotumanUserAPI.h
//  LCHTTPSessionManager
//
//  Created by chanli on 15/11/21.
//  Copyright © 2015年 aotumanlady Inc. All rights reserved.
//

#import "LCHTTPSessionManager.h"

typedef NS_ENUM(NSUInteger,LCCheckMobileModel) {
    LCCheckMobileSMSModel = 100,
    LCCheckMobilePhoneModel = 101,
};

@interface LCHTTPSessionManager (AotumanUserAPI)

- (NSURLSessionDataTask *)signin:(NSString *)username
                        password:(NSString *)password
                         success:(void (^)(NSDictionary *))success
                         failure:(LCHTTPSessionFailureBlock)failure;
@end
