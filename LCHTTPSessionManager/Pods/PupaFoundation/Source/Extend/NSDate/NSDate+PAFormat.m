//
//  NSDate+PAFormat.m
//  PupaFoundation
//
//  Created by Candyan on 4/11/13.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import "NSDate+PAFormat.h"

@implementation NSDate (PAFormat)

+ (NSCache *)dateFormatCache
{
    static NSCache *singleton;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      singleton = [[NSCache alloc] init];
      singleton.totalCostLimit = 100;
    });

    return singleton;
}

- (NSString *)stringWithFormat:(NSString *)formatString
{
    NSString *cacheKey = [NSString stringWithFormat:@"dateForString: %@ format: %@", self, formatString];
    NSString *formattedString = [[NSDate dateFormatCache] objectForKey:cacheKey];

    if (formattedString == nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
        [formatter setLocale:locale];
        [formatter setTimeZone:[NSTimeZone localTimeZone]];

        [formatter setDateFormat:formatString];
        formattedString = [formatter stringFromDate:self];

        [[NSDate dateFormatCache] setObject:formattedString forKey:cacheKey cost:1];
    }

    return formattedString;
}

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)formatString
{
    NSString *cacheKey = [NSString stringWithFormat:@"dateWithString: %@ format: %@", string, formatString];
    NSDate *date = [[NSDate dateFormatCache] objectForKey:cacheKey];
    if (date == nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
        [formatter setLocale:locale];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];

        [formatter setDateFormat:formatString];
        date = [formatter dateFromString:string];

        [[NSDate dateFormatCache] setObject:date forKey:cacheKey];
    }

    return date;
}

@end
