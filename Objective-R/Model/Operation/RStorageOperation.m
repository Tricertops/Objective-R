//
//  RStorageOperation.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RStorageOperation.h"










@implementation RStorageOperation





- (id)evaluateInProcess:(RProcess *)process {
    id leftResult = [self.storage evaluateInProcess:process];
    id rightResult = [self.operand evaluateInProcess:process];
    
    // This is basically combination of binary operation and storage.
    
    id result = [self resultOfLeft:leftResult right:rightResult];
    
    //TODO: Better way:
    result = [[self.storage setTo:R(result)] evaluateInProcess:process];
    
    return result;
}


- (id)resultOfLeft:(id)leftResult right:(id)rightResult {
    if ( ! leftResult || ! rightResult) return nil;
    
    switch ((RStorageOperator)self.operator) {
        case ROperatorStorageNone: return leftResult;
            
        case ROperatorStorageIncrementBy: return [leftResult R_resultOfPlusWithObject:    rightResult];
        case ROperatorStorageDecrementBy: return [leftResult R_resultOfMinusWithObject:   rightResult];
        case ROperatorStorageMultiplyBy:  return [leftResult R_resultOfMultiplyWithObject:rightResult];
        case ROperatorStorageDivideBy:    return [leftResult R_resultOfDivideWithObject:  rightResult];
    }
    
    return leftResult;
}





- (NSString *)code {
    BOOL isOne = ([self.operand isKindOfClass:[RConstant class]] && [[(RConstant *)self.operand value] isEqual:@1] );
    if (isOne) {
        if (self.operator == ROperatorStorageIncrementBy) {
            return [NSString stringWithFormat:@"%@++", [self.storage code]];
        }
        if (self.operator == ROperatorStorageDecrementBy) {
            return [NSString stringWithFormat:@"%@−−", [self.storage code]];
        }
    }
    return [NSString stringWithFormat:@"%@ %@ %@", [self.storage code], [[ROperation stringsForOperator:self.operator] firstObject], [self.operand code]];
}





@end


