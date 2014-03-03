//
//  RUnaryOperation.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RUnaryOperation.h"










@implementation RUnaryOperation





- (id)evaluateInScope:(RScope *)scope {
    id result = [self.operand evaluateInScope:scope];
    
    if ( ! result) return nil;
    
    switch ((RUnaryOperator)self.operator) {
        case ROperatorUnaryPlus:    return result;
        case ROperatorUnaryMinus:   return [result R_resultOfUnaryMinus];
        case ROperatorNot:          return @( ! [result R_booleanValue] );
    }
    
    return nil;
}





- (NSString *)code {
    return [NSString stringWithFormat:@"%@%@", [[ROperation stringsForOperator:self.operator] firstObject], [self.operand code]];
}





@end


