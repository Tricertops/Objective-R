//
//  ROperation.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "RConstant.h"
#import "RExpression+ROperation.h"
#import "ROperators+NSObject.h"
#import "ROperators+NSNumber.h"



typedef NSInteger ROperator;
typedef enum RUnaryOperator : ROperator RUnaryOperator;
typedef enum RBinaryOperator : ROperator RBinaryOperator;





@interface ROperation : RExpression


+ (ROperation *)unary:(RUnaryOperator)operator of:(RExpression *)operand;
+ (ROperation *)binary:(RBinaryOperator)operator left:(RExpression *)operand right:(RExpression *)operand;

@property (atomic, readwrite, assign) ROperator operator;
- (NSArray *)operands;


+ (NSArray *)stringsForOperator:(ROperator)operator;


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
    ROperatorNotEqualTo = '!',
    ROperatorLessThan = '<',
    ROperatorGreaterThan = '>',
    ROperatorLessThanOrEqualTo = ROperatorLessThan + ROperatorEqualTo,
    ROperatorGreaterThanOrEqualTo = ROperatorGreaterThan + ROperatorEqualTo,
    
    ROperatorAnd = '&',
    ROperatorOr = '|',
};



