//
//  RConstant.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RConstant.h"





@implementation RConstant





+ (instancetype)constant:(id)value {
    RConstant *constant = [[self alloc] init];
    constant.value = value;
    return constant;
}


+ (NSMutableArray *)replaceConstantsInArray:(NSMutableArray *)array {
    NSUInteger count = array.count;
    for (NSUInteger index = 0; index < count; index++) {
        id object = [array objectAtIndex:index];
        BOOL isExpression = [object isKindOfClass:[RExpression class]];
        if ( ! isExpression) {
            [array replaceObjectAtIndex:index withObject:[RConstant constant:object]];
        }
    }
    return array;
}


- (id)evaluateInScope:(__unused RScope *)scope {
    return self.value;
}





- (NSString *)code {
    if (self.value == nil) return @"void";
    if (self.value == NSNull.null) return @"nil";
    return [self.value description];
}





@end


