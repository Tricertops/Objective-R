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
#import "RForInLoop.h"
#import "ROperation.h"
#import "RScope.h"










@implementation RLoop





#pragma mark - Build Time


+ (RLoop *)while:(RExpression *)condition do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RWhileLoop *loop = [[RWhileLoop alloc] init];
    loop.condition = condition;
    
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    loop.expression = scope;
    
    return loop;
}



+ (RLoop *)for:(RExpression *)initializer condition:(RExpression *)condition step:(RExpression *)step do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RForLoop *loop = [[RForLoop alloc] init];
    loop.initializer = initializer;
    loop.condition = condition;
    loop.step = step;
    
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    loop.expression = scope;
    
    return loop;
}


+ (RLoop *)for:(RVariable *)iterator from:(RExpression *)fromValue to:(RExpression *)toValue do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RForLoop *loop = [[RForLoop alloc] init];
    loop.initializer = [iterator create:fromValue];
    loop.condition = [iterator isLessThanOrEqualTo:toValue];
    loop.step = [iterator incrementBy:R(@1)];
    
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    loop.expression = scope;
    
    return loop;
}



+ (RLoop *)for:(RVariable *)iterator in:(RExpression *)container do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RForInLoop *loop = [[RForInLoop alloc] init];
    loop.storage = iterator;
    loop.container = container;
    
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    loop.expression = scope;
    
    return loop;
}





@end


