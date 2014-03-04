//
//  RBinaryOperation.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSComparisonPredicate;
@import Foundation.NSExpression;
#import "RBinaryOperation.h"
#import "RProcess.h"










@implementation RBinaryOperation





#pragma mark - Build Time


- (NSString *)code {
    return [NSString stringWithFormat:@"%@ %@ %@", [self.leftOperand code], [[ROperation stringsForOperator:self.operator] firstObject], [self.rightOperand code]];
}





#pragma mark - Run Time


- (id)evaluateInProcess:(RProcess *)process {
    id leftResult = [process resultOfExpression:self.leftOperand];
    if ( ! leftResult) return nil;
    
    BOOL leftBoolean = [leftResult R_booleanValue];
    // Incomplete evaluation. Right operand is not even evaluated, because it would never change the result.
    if (self.operator == ROperatorAnd && ! leftBoolean) return @NO;
    if (self.operator == ROperatorOr  &&   leftBoolean) return @YES;
    
    id rightResult = [process resultOfExpression:self.rightOperand];
    if ( ! rightResult) return nil;
    
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
            
        case ROperatorAnd: return @( leftBoolean && [rightResult R_booleanValue] );
        case ROperatorOr:  return @( leftBoolean || [rightResult R_booleanValue] );
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


