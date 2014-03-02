//
//  NSString+RCode.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "NSString+RCode.h"










@implementation NSString (RCode)





- (NSString *)stringByIndentingLinesBy:(NSUInteger)indent {
    NSMutableString *builder = [[NSMutableString alloc] init];
    [self enumerateLinesUsingBlock:^(NSString *line, __unused BOOL *stop) {
        
        for (NSUInteger index = 0; index < indent; index++) {
            [builder appendString:@" "];
        }
        [builder appendString:line];
        [builder appendString:@"\n"];
        
    }];
    return builder;
}





@end


