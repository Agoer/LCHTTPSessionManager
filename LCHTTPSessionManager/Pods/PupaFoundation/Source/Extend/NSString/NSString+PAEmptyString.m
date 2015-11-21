//
//  NSString+PAEmptyString.m
//  PupaDemo
//
//  Created by liuyan on 14-10-20.
//  Copyright (c) 2014年 Douban.Inc. All rights reserved.
//

#import "NSString+PAEmptyString.h"

@implementation NSString (PAEmptyString)

- (BOOL)isNotEmpty
{
    return ![self isEqualToString:@""];
}

- (BOOL)isEmpty
{
    return [self isEqualToString:@""];
}

@end
