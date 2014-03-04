//
//  RStorage.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSException;
#import "RStorage.h"
#import "ROperation.h"










@implementation RStorage





- (RExpression *)setTo:(__unused RExpression *)value {
    NSAssert(NO, @"Abstract implementation.");
    return RVoid;
}





- (RExpression *)incrementBy:(RExpression *)value {
    return [self setTo:[self plus:value]];
}


- (RExpression *)decrementBy:(RExpression *)value {
    return [self setTo:[self minus:value]];
}





@end


