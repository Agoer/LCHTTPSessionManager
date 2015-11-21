//
//  NSDate+PATimeInterval.m
//  PupaFoundation
//
//  Created by Candyan on 13-5-15.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import "NSDate+PATimeInterval.h"

@implementation NSDate (PATimeInterval)

- (BOOL)isSameDay:(NSDate *)otherDate
{
    return ([self timeIntervalSinceDate:otherDate unit:NSCalendarUnitDay] == 0);
}

- (NSInteger)timeIntervalSinceDate:(NSDate *)anotherDate unit:(NSCalendarUnit)calendarUnit
{
    if (anotherDate == nil) return NSIntegerMax;

    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [currentCalendar components:calendarUnit
                                                      fromDate:anotherDate
                                                        toDate:self
                                                       options:0];

    switch (calendarUnit) {
        case NSCalendarUnitNanosecond:
            return components.nanosecond;

        case NSCalendarUnitSecond:
            return components.second;

        case NSCalendarUnitMinute:
            return components.minute;

        case NSCalendarUnitQuarter:
            return components.quarter;

        case NSCalendarUnitHour:
            return components.hour;

        case NSCalendarUnitDay:
            return components.day;

        case NSCalendarUnitWeekday:
            return components.weekday;

        case NSCalendarUnitWeekdayOrdinal:
            return components.weekdayOrdinal;

        case NSCalendarUnitWeekOfMonth:
            return components.weekOfMonth;

        case NSCalendarUnitWeekOfYear:
            return components.weekOfYear;

        case NSCalendarUnitMonth:
            return components.month;

        case NSCalendarUnitYear:
            return components.year;

        case NSCalendarUnitYearForWeekOfYear:
            return components.yearForWeekOfYear;

        case NSCalendarUnitEra:
            return components.era;

        default:
            return NSIntegerMax;
    }
}

@end
