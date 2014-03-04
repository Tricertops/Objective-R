//
//  RBranch.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RBranch.h"
#import "RIfElseBranch.h"
#import "RConstant.h"
#import "RScope.h"










@implementation RBranch





#pragma mark - Build Time


+ (RBranch *)if:(RExpression *)condition then:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RScope *scope = [[RScope alloc] init];
    scope.expressions = RVariadicArray(expression);
    
    return [RBranch if:condition then:scope else:RNull];
}


+ (RBranch *)if:(RExpression *)condition then:(NSObject *)thenExpression else:(NSObject *)elseExpression {
    RIfElseBranch *branch = [[RIfElseBranch alloc] init];
    branch.condition = condition;
    branch.thenExpression = [RExpression expressionFrom:thenExpression];
    branch.elseExpression = [RExpression expressionFrom:elseExpression];
    return branch;
}





@end


