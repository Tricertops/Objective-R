//
//  NSString+RCode.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSString;


#define RCodeIndent     4





@interface NSString (RCode)



- (NSString *)stringByIndentingLinesBy:(NSUInteger)indent;



@end


