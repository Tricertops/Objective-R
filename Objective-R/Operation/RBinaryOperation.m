//
//  RBinaryOperation.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RBinaryOperation.h"
#import "NSObject+ROperators.h"
@import Foundation.NSComparisonPredicate;
@import Foundation.NSExpression;










@implementation RBinaryOperation





- (id)evaluateInScope:(RScope *)scope {
    id leftResult = [self.leftOperand evaluateInScope:scope];
    id rightResult = [self.rightOperand evaluateInScope:scope];
    
    if ( ! leftResult || ! rightResult) return nil;
    
    switch ((RBinaryOperator)self.operator) {
        case ROperatorNone:     return nil;
            
        case ROperatorPlus:     return [leftResult R_resultOfPlusWithObject:    rightResult];
        case ROperatorMinus:    return [leftResult R_resultOfMinusWithObject:   rightResult];
        case ROperatorMultiply: return [leftResult R_resultOfMultiplyWithObject:rightResult];
        case ROperatorDivide:   return [leftResult R_resultOfDivideWithObject:  rightResult];
        case ROperatorModulo:   return [leftResult R_resultOfModuloWithObject:  rightResult];
            
        case ROperatorEqualTo:              return [self compare:leftResult using:             NSEqualToPredicateOperatorType with:rightResult];
        case ROperatorNotEqualTo:           return [self compare:leftResult using:          NSNotEqualToPredicateOperatorType with:rightResult];
        case ROperatorLessThan:             return [self compare:leftResult using:            NSLessThanPredicateOperatorType with:rightResult];
        case ROperatorGreaterThan:          return [self compare:leftResult using:         NSGreaterThanPredicateOperatorType with:rightResult];
        case ROperatorLessThanOrEqualTo:    return [self compare:leftResult using:   NSLessThanOrEqualToPredicateOperatorType with:rightResult];
        case ROperatorGreaterThanOrEqualTo: return [self compare:leftResult using:NSGreaterThanOrEqualToPredicateOperatorType with:rightResult];
            
        case ROperatorAnd: return @( [leftResult R_booleanValue] && [rightResult R_booleanValue] );
        case ROperatorOr:  return @( [leftResult R_booleanValue] || [rightResult R_booleanValue] );
    }

    return nil;
}


- (NSNumber *)compare:(id)left using:(NSPredicateOperatorType)type with:(id)right {
    NSPredicate *predicate = [NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionForConstantValue:left]
                                                                rightExpression:[NSExpression expressionForConstantValue:right]
                                                                       modifier:NSDirectPredicateModifier
                                                                           type:type
                                                                        options:kNilOptions];
    return @( [predicate evaluateWithObject:nil] );
}





@end


