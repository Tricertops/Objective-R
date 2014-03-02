//
//  RBinaryOperation.h
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "ROperation.h"





@interface RBinaryOperation : ROperation



@property (atomic, readwrite, assign) RBinaryOperator operator;
@property (atomic, readwrite, strong) RExpression *leftOperand;
@property (atomic, readwrite, strong) RExpression *rightOperand;

- (id)evaluateInScope:(RScope *)scope;



@end


