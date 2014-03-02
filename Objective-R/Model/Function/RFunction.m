//
//  RFunction.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RFunction.h"










@implementation RFunction





+ (RFunction *)function:(NSString *)name arguments:(NSArray *)args implementation:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RFunction *function = [[RFunction alloc] init];
    function.name = name;
    function.arguments = args;
    
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    function.implementation = scope;
    
    return function;
}





@end


