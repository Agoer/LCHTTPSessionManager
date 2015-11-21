//
//  NSDictionary+PAJSONSerialization.h
//  PupaFoundation
//
//  Created by Candyan on 2/10/14.
//  Copyright (c) 2014 Candyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (PAJSONSerialization)

- (NSData *)JSONData;
- (NSString *)JSONString;

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)jsonStr;
+ (NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData;

@end
