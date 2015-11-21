//
//  NSString+PAReplacing.h
//  PupaFoundation
//
//  Created by Candyan on 6/4/13.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PAReplacing)

- (NSString *)stringByTrimingWhitespace;
- (NSString *)stringByTrimingWhitespaceAndNewline;

- (NSString *)stringByReplacingCharactersInSet:(NSCharacterSet *)set
                                    withString:(NSString *)replacement;

@end
