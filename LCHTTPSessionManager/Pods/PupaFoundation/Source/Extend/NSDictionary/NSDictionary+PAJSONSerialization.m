//
//  NSDictionary+PAJSONSerialization.m
//  PupaFoundation
//
//  Created by Candyan on 2/10/14.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import "NSDictionary+PAJSONSerialization.h"

@implementation NSDictionary (PAJSONSerialization)

- (NSData *)JSONData
{
  return [NSJSONSerialization dataWithJSONObject:self options:0 error:NULL];
}

- (NSString *)JSONString
{
  NSData *data = [self JSONData];
  if (data == nil) {
    return nil;
  }

  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)jsonStr
{
    return [NSDictionary dictionaryFromJSONData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData
{
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
}

@end
