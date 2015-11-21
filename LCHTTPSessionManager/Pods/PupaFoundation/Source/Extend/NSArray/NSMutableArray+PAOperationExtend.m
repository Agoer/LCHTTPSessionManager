//
//  NSMutableArray+PAOperationExtend.m
//  PupaDemo
//
//  Created by liuyan on 15-1-26.
//  Copyright (c) 2015年 Douban.Inc. All rights reserved.
//

#import "NSMutableArray+PAOperationExtend.h"

@implementation NSMutableArray (PAOperationExtend)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    NSAssert(fromIndex < self.count, @"From Index should not be over array count.");
    NSAssert(toIndex < self.count, @"To Index should not be over array count.");

    if (fromIndex < self.count && toIndex < self.count) {
        id object = [self objectAtIndex:fromIndex];
        [self removeObjectAtIndex:fromIndex];
        [self insertObject:object atIndex:toIndex];
    }
}

@end
