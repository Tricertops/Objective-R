//
//  NSObject+ROperators.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import ObjectiveC.message;
@import Foundation.NSNull;
#import "NSObject+ROperators.h"










@implementation NSObject (ROperators)





- (id)R_resultOfUnaryMinus {
    return [self R_minus];
}





- (id)R_resultOfPlusWithObject:(id)otherObject {
    if ( ! otherObject) return nil;
    id result = nil;
    
    // 5 + 3
    result = [self R_resultOfPlusWithObject:otherObject];
    if (result) return result;
    
    // 3 + 5
    // If objects are of different classes and only one of them overrides the operator.
    result = [otherObject R_resultOfPlusWithObject:self];
    if (result) return result;
    
    return nil;
}


- (id)R_resultOfMinusWithObject:(id)otherObject {
    if ( ! otherObject) return nil;
    id result = nil;
    
    // 5 - 3
    result = [self R_minus:otherObject];
    if (result) return result;
    
    // 5 + (-3)
    // If other object doesn't override -minus:, but does -minus.
    id minusOtherObject = [otherObject R_resultOfUnaryMinus];
    if (minusOtherObject) {
        result = [self R_resultOfPlusWithObject:minusOtherObject];
        if (result) return result;
    }
    
    return nil;
}





- (id)R_resultOfMultiplyWithObject:(id)otherObject {
    if ( ! otherObject) return nil;
    id result = nil;
    
    // 5 * 3
    result = [self R_multiply:otherObject];
    if (result) return result;
    
    // 3 * 5
    // If objects are of different classes and only one of them overrides the operator. Example: 5 * a –> a * 5 = aaaaa
    result = [otherObject R_multiply:self];
    if (result) return result;
    
    // 5 + 5 + 5
    // If other object has numeric value.
    result = [self R__resultOfPlusMultipleTimes:[otherObject R_numberValue]];
    if (result) return result;
    
    // 3 + 3 + 3 + 3
    // If this object has numeric value.
    result = [otherObject R__resultOfPlusMultipleTimes:[self R_numberValue]];
    if (result) return result;
    
    return nil;
}


- (id)R__resultOfPlusMultipleTimes:(NSNumber *)number {
    if ( ! number) return nil;
    
    NSUInteger integer = [number unsignedIntegerValue];
    id result = self;
    for (NSUInteger i = 0; i < integer; i++) {
        result = [self R_plus:result];
        if ( ! result) break;
    }
    return result;
}


- (id)R_resultOfDivideWithObject:(id)otherObject {
    if ( ! otherObject) return nil;
    id result = nil;
    
    // 12 / 4
    result = [self R_divide:otherObject];
    if (result) return result;
    
    // 12 * 1/4
    // If object does not oveeride division by number, but overrides multiplication.
    id invertedOtherObject = [@1 R_divide:otherObject];
    if (invertedOtherObject) {
        result = [self R_resultOfMultiplyWithObject:invertedOtherObject];
        if (result) return result;
    }
    
    return result;
}


- (id)R_resultOfModuloWithObject:(id)otherObject {
    if ( ! otherObject) return nil;
    
    return [self R_modulo:otherObject];
}





- (NSNumber *)R_numberValue {
    if ([self isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)self;
    }
    else {
        return nil;
    }
}


- (BOOL)R_booleanValue {
    if ([self respondsToSelector:@selector(boolValue)]) {
        return [(id)self boolValue];
    }
    else return ! [self isKindOfClass:[NSNull class]];
}





@end










@implementation NSObject (ROperators_Override)





- (id)R_minus {
    return nil;
}


- (id)R_plus:(id)other {
    return nil;
}


- (id)R_minus:(id)other {
    return nil;
}


- (id)R_multiply:(id)other {
    return nil;
}


- (id)R_divide:(id)other {
    return nil;
}


- (id)R_modulo:(id)other {
    return nil;
}





@end


