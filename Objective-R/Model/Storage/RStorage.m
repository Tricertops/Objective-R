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
    return [ROperation storage:ROperatorStorageIncrementBy left:self right:value];
}


- (RExpression *)decrementBy:(RExpression *)value {
    return [ROperation storage:ROperatorStorageDecrementBy left:self right:value];
}





@end


