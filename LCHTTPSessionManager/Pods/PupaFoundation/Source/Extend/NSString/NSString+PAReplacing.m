//
//  NSString+PAReplacing.m
//  PupaFoundation
//
//  Created by Jianjun Wu on 6/4/13.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import "NSString+PAReplacing.h"

@implementation NSString (PAReplacing)

- (NSString *)stringByTrimingWhitespace
{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimingWhitespaceAndNewline
{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByReplacingCharactersInSet:(NSCharacterSet *)set
                                    withString:(NSString *)replacement
{
  NSAssert(replacement != nil, @"Replacement should not be nil.");
  NSAssert(set != nil, @"ReplacingCharactersSet should not be nil.");
  
  NSMutableString *replacedString = [NSMutableString stringWithString:self];

  NSRange characterSetRange = [replacedString rangeOfCharacterFromSet:set];
  while (characterSetRange.location != NSNotFound) {
    [replacedString replaceCharactersInRange:characterSetRange withString:replacement];
    characterSetRange = [replacedString rangeOfCharacterFromSet:set];
  }
  return [replacedString copy];
}

@end
