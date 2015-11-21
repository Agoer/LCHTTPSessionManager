//
//  NSString+PADigest.m
//  PupaFoundation
//
//  Created by Candyan on 10/04/13.
//  Copyright (c) 2013 Candyan. All rights reserved.
//

#import "NSString+PADigest.h"
#import "NSData+PADigest.h"

@implementation NSString (PADigest)

- (NSString *)md5
{
  return [[self dataUsingEncoding:NSUTF8StringEncoding] md5];
}

- (NSString *)sha1
{
  return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1];
}

- (NSString *)sha256
{
  return [[self dataUsingEncoding:NSUTF8StringEncoding] sha256];
}

- (NSString *)sha512
{
  return [[self dataUsingEncoding:NSUTF8StringEncoding] sha512];
}

@end
