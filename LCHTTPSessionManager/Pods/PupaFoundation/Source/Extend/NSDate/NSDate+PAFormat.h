//
//  NSDate+PAFormat.h
//  PupaFoundation
//
//  Created by Candyan on 4/11/13.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PAFormat)

- (NSString *)stringWithFormat:(NSString *)formatString;

+ (NSDate *)dateFromString:(NSString *)string
                    format:(NSString *)formatString;

@end
