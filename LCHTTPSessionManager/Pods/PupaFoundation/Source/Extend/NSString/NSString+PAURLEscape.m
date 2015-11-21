//
//  NSString+PAURLEscape.m
//  PupaFoundation
//
//  Created by Candyan on 4/8/13.
//
//

#import "NSString+PAURLEscape.h"

@implementation NSString (PAURLEscape)

- (NSString *)encodingStringUsingURLEscape
{
  CFStringRef originStringRef = (__bridge_retained CFStringRef)self;
  CFStringRef escapedStringRef = CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                         originStringRef,
                                                                         NULL,
                                                                         (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                         kCFStringEncodingUTF8);
  NSString *escapedString = (__bridge_transfer NSString *)escapedStringRef;
  CFRelease(originStringRef);
  return escapedString;
}

- (NSString *)decodingStringUsingURLEscape
{
  CFStringRef originStringRef = (__bridge_retained CFStringRef)self;
  CFStringRef escapedStringRef = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                         originStringRef,
                                                                                         CFSTR(""),
                                                                                         kCFStringEncodingUTF8);
  NSString *escapedString = (__bridge_transfer NSString *)escapedStringRef;
  CFRelease(originStringRef);
  return escapedString;
}

@end
