//
//  RScope.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RScope.h"
#import "RConstant.h"





@implementation RScope





+ (instancetype)scope:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RScope *scope = [[self alloc] init];
    scope.expressions = [RConstant replaceConstantsInArray:RVariadicArray(expression)];
    return scope;
}


- (id)evaluateInScope:(RScope *)scope {
    id result = nil;
    
    //TODO: Accessible result and parentScope
    
    for (RExpression *exp in self.expressions) {
        result = [exp evaluateInScope:self];
    }
    
    return result;
}





@end


