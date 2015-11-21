//
//  NSString+PADigest.h
//  PupaFoundation
//
//  Created by Chongyu Zhu on 10/04/13.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PADigest)

- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha256;
- (NSString *)sha512;

@end
