//
//  RLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RLoop.h"
#import "RWhileLoop.h"
#import "RForLoop.h"
#import "RExpression+ROperation.h"
#import "RScope.h"










@implementation RLoop





+ (RLoop *)while:(RExpression *)condition do:(RExpression *)expression {
    RWhileLoop *loop = [[RWhileLoop alloc] init];
    loop.condition = condition;
    loop.expression = expression;
    return loop;
}


+ (RLoop *)for:(RVariable *)iterator from:(RExpression *)fromValue to:(RExpression *)toValue do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RForLoop *loop = [[RForLoop alloc] init];
    loop.variable = [iterator create:fromValue];
    loop.condition = [loop.variable isLessThanOrEqualTo:toValue];
    loop.step = [loop.variable incrementBy:R(@1)];
    
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    loop.scope = scope;
    
    return loop;
}





@end


