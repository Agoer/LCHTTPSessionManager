//
//  NSURL+PAURLParsing.m
//  PupaDemo
//
//  Created by liuyan on 3/30/15.
//  Copyright (c) 2015 Douban.Inc. All rights reserved.
//

#import "NSURL+PAURLParsing.h"
#import "NSString+PAURLEscape.h"

@implementation NSURL (PAURLParsing)

- (NSDictionary *)querys
{
    NSString *query = [self query];
    if ([query length] == 0) {
        return nil;
    }

    // Replace '+' with space
    query = [query stringByReplacingOccurrencesOfString:@"+" withString:@"%20"];

    NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary *pairs = [NSMutableDictionary dictionary];

    NSScanner *scanner = [[NSScanner alloc] initWithString:query];
    while (![scanner isAtEnd]) {
        NSString *pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            [pairs setObject:[[kvPair objectAtIndex:1] decodingStringUsingURLEscape]
                      forKey:[[kvPair objectAtIndex:0] decodingStringUsingURLEscape]];
        }
    }

    return [pairs copy];
}

@end
