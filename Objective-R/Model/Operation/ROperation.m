//
//  ROperation.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software:s.r.o. All rights reserved.
//

#import "ROperation.h"
#import "RUnaryOperation.h"
#import "RBinaryOperation.h"
#import "RStorageOperation.h"










@implementation ROperation





#pragma mark Build Time


+ (instancetype)unary:(RUnaryOperator)operator of:(NSObject *)operand {
    RUnaryOperation *operation = [[RUnaryOperation alloc] init];
    operation.operator = operator;
    operation.operand = [RExpression expressionFrom:operand];
    return operation;
}


+ (instancetype)binary:(RBinaryOperator)operator left:(NSObject *)left right:(NSObject *)right {
    RBinaryOperation *operation = [[RBinaryOperation alloc] init];
    operation.operator = operator;
    operation.leftOperand = [RExpression expressionFrom:left];
    operation.rightOperand = [RExpression expressionFrom:right];
    return operation;
}


+ (ROperation *)storage:(RStorageOperator)operator left:(RStorage *)storage right:(NSObject *)operand {
    RStorageOperation *operation = [[RStorageOperation alloc] init];
    operation.operator = operator;
    operation.storage = storage;
    operation.operand = [RExpression expressionFrom:operand];
    return operation;
}



+ (NSArray *)stringsForOperator:(ROperator)operator {
    //TODO: ROperator class with metadata like this? Support for custom subclasses?
    
    switch ((RBinaryOperator)operator) {
        case ROperatorNone: return @[ @"", @"none" ];
            
        case ROperatorPlus:     return @[ @"+", @"plus", @"add", @"positive" ];
        case ROperatorMinus:    return @[ @"−", @"-", @"minus", @"subtract", @"subtraction", @"negative" ];
        case ROperatorMultiply: return @[ @"×", @"*", @"multiply by", @"multiplication" ];
        case ROperatorDivide:   return @[ @"÷", @"/", @"div", @"divide by", @"division" ];
        case ROperatorModulo:   return @[ @"mod", @"%", @"modulo", @"rem", @"remainder" ];
            
        case ROperatorEqualTo:     return @[ @"=", @"≟", @"==", @"===", @"eq", @"equal to", @"equality" ];
        case ROperatorNotEqualTo:  return @[ @"≠", @"!=", @"ne", @"not equal to", @"inequality" ];
        case ROperatorLessThan:    return @[ @"<", @"lt", @"less than" ];
        case ROperatorGreaterThan: return @[ @">", @"gt", @"greater than" ];
        case ROperatorLessThanOrEqualTo:    return @[ @"≤", @"<=", @"le", @"less than or equal to" ];
        case ROperatorGreaterThanOrEqualTo: return @[ @"≥", @">=", @"ge", @"greater than or equal to" ];
            
        case ROperatorAnd: return @[ @"∧", @"&", @"·", @"and", @"conjunction" ];
        case ROperatorOr:  return @[ @"∨", @"|", @"or", @"disjunction" ];
    }
    
    switch ((RStorageOperator)operator) {
        case ROperatorStorageNone: return @[ @"", @"none" ];
            
        case ROperatorStorageIncrementBy: return @[ @"+←", @"+=", @"set incremented by" ];
        case ROperatorStorageDecrementBy: return @[ @"−←", @"-=", @"set decremented by" ];
            
        case ROperatorStorageMultiplyBy:  return @[ @"×←", @"set multiplied by" ];
        case ROperatorStorageDivideBy:    return @[ @"÷←", @"set divided by" ];
    }
    
    switch ((RUnaryOperator)operator) {
        case ROperatorUnaryPlus:  return @[ @"+", @"plus", @"positive" ];
        case ROperatorUnaryMinus: return @[ @"−", @"-", @"minus", @"negation" ];
        case ROperatorNot:        return @[ @"¬", @"!", @"not", @"negate", @"negation" ];
    }
    
    return @[ @"?", @"undefined" ];
}





@end


