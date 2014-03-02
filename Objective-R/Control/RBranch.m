//
//  RBranch.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RBranch.h"
#import "RIfElseBranch.h"





@implementation RBranch





+ (RBranch *)if:(RExpression *)condition then:(RExpression *)thenExpression {
    return [RBranch if:condition then:thenExpression else:nil];
}


+ (RBranch *)if:(RExpression *)condition then:(RExpression *)thenExpression else:(RExpression *)elseExpression {
    RIfElseBranch *branch = [[RIfElseBranch alloc] init];
    branch.condition = condition;
    branch.thenExpression = thenExpression;
    branch.elseExpression = elseExpression;
    return branch;
}





@end


