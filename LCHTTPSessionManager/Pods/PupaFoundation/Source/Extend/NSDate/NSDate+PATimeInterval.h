//
//  NSDate+PATimeInterval.h
//  PupaFoundation
//
//  Created by Candyan on 13-5-15.
//  Copyright (c) 2014 Candyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PATimeInterval)

- (BOOL)isSameDay:(NSDate *)otherDate;

- (NSInteger)timeIntervalSinceDate:(NSDate *)anotherDate unit:(NSCalendarUnit)calendarUnit;

@end
