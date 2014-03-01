//
//  ROperation.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "RConstant.h"
#import "ROperators+NSObject.h"
@class RUnaryOperation;
@class RBinaryOperation;



typedef NSInteger ROperator;
typedef enum RUnaryOperator : ROperator RUnaryOperator;
typedef enum RBinaryOperator : ROperator RBinaryOperator;





@interface ROperation : RExpression


+ (RUnaryOperation *)unary:(RUnaryOperator)operator of:(RExpression *)operand;
+ (RBinaryOperation *)left:(RExpression *)operand binary:(RBinaryOperator)operator right:(RExpression *)operand;

@property (atomic, readwrite, assign) ROperator operator;
- (NSArray *)operands;


@end





enum RUnaryOperator : ROperator {
    ROperatorUnaryPlus = 0,
    
    ROperatorUnaryMinus = '-',
    ROperatorNot = '!',
};

enum RBinaryOperator : ROperator {
    ROperatorNone = 0,
    
    ROperatorPlus = '+',
    ROperatorMinus = '-',
    ROperatorMultiply = '*',
    ROperatorDivide = '/',
    ROperatorModulo = '%',
    
    ROperatorEqualTo = '=',
    ROperatorNotEqualTo = '^',
    ROperatorLessThan = '<',
    ROperatorGreaterThan = '>',
    ROperatorLessThanOrEqualTo = ROperatorLessThan + ROperatorEqualTo,
    ROperatorGreaterThanOrEqualTo = ROperatorGreaterThan + ROperatorEqualTo,
    
    ROperatorAnd = '&',
    ROperatorOr = '|',
};



