//
//  PACommonFunctions.m
//  PupaDemo
//
//  Created by liuyan on 3/31/15.
//  Copyright (c) 2015 Douban.Inc. All rights reserved.
//

#import "PACommonFunctions.h"

CGPoint PA2DPointMakeWith1DPoint(NSUInteger point, NSUInteger countPerRow)
{
    return CGPointMake(point % countPerRow, point / countPerRow);
}

NSUInteger PA1DPointWith2DPoint(CGPoint point, NSUInteger countPerRow)
{
    if (point.x >= 0 && point.x < countPerRow && point.y >= 0) {
        return point.x + point.y * countPerRow;
    } else {
        return NSNotFound;
    }
}

