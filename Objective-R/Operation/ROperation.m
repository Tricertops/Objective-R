//
//  ROperation.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software:s.r.o. All rights reserved.
//

#import "ROperation.h"





@implementation ROperation




+ (instancetype)unary:(RUnaryOperator)operator of:(RExpression *)operand {
    ROperation *operation = [[ROperation alloc] init];
    operation.operator = operator;
    operation.operands = @[ operand ];
    return operation;
}


+ (instancetype)left:(RExpression *)left binary:(RBinaryOperator)operator right:(RExpression *)right {
    ROperation *operation = [[ROperation alloc] init];
    operation.operator = operator;
    operation.operands = @[ left, right ];
    return operation;
}


+ (instancetype)multiary:(ROperator)operator operands:(RExpression *)operand, ... NS_REQUIRES_NIL_TERMINATION {
    ROperation *operation = [[ROperation alloc] init];
    operation.operator = operator;
    operation.operands = RVariadicArray(operand);
    return operation;
}


+ (NSArray *)stringsForOperator:(ROperator)operator {
    switch ((RBinaryOperator)operator) {
        case ROperatorNone: return @[ @"", @"none" ];
            
        case ROperatorPlus:     return @[ @"+", @"plus", @"add", @"positive" ];
        case ROperatorMinus:    return @[ @"−", @"-", @"minus", @"subtract", @"subtraction", @"negative" ];
        case ROperatorMultiply: return @[ @"×", @"*", @"multiply by", @"multiplication" ];
        case ROperatorDivide:   return @[ @"÷", @"/", @"div", @"divide by", @"division" ];
        case ROperatorModulo:   return @[ @"mod", @"%", @"modulo", @"rem", @"remainder" ];
            
        case ROperatorEqualTo:  return @[ @"=", @"≟", @"==", @"===", @"eq", @"equal to", @"equality" ];
        case ROperatorUnequal:  return @[ @"≠", @"!=", @"ne", @"not equal to", @"inequality" ];
        case ROperatorLessThan: return @[ @"<", @"lt", @"less than" ];
        case ROperatorGreaterThan:  return @[ @">", @"gt", @"greater than" ];
        case ROperatorLessThanOrEqualTo:      return @[ @"≤", @"<=", @"le", @"less than or equal to" ];
        case ROperatorGreaterThanOrEqualTo:   return @[ @"≥", @">=", @"ge", @"greater than or equal to" ];
            
        case ROperatorAnd:  return @[ @"∧", @"&", @"·", @"and", @"conjunction" ];
        case ROperatorOr:   return @[ @"∨", @"|", @"or", @"disjunction" ];
    }
    
    switch ((RUnaryOperator)operator) {
        case ROperatorUnaryPlus:     return @[ @"+", @"plus", @"positive" ];
        case ROperatorUnaryMinus:    return @[ @"−", @"-", @"minus", @"negation" ];
        case ROperatorNot:          return @[ @"¬", @"!", @"not", @"negate", @"negation" ];
    }
    
    return @[ @"?", @"undefined" ];
}





@end


