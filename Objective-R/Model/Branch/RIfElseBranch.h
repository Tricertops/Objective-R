//
//  RIfElseBranch.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RBranch.h"





@interface RIfElseBranch : RBranch



#pragma mark - Build Time

@property (atomic, readwrite, strong) RExpression *condition;
@property (atomic, readwrite, strong) RExpression *thenExpression;
@property (atomic, readwrite, strong) RExpression *elseExpression;

- (NSString *)code;



#pragma mark - Run Time

- (id)evaluateInProcess:(RProcess *)process;



@end


