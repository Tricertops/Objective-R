//
//  NSObject+ROperators.h
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSObject;





@interface NSObject (ROperators)



- (id)R_resultOfUnaryMinus;

- (id)R_resultOfPlusWithObject:(id)otherObject;
- (id)R_resultOfMinusWithObject:(id)otherObject;

- (id)R_resultOfMultiplyWithObject:(id)otherObject;
- (id)R_resultOfDivideWithObject:(id)otherObject;
- (id)R_resultOfModuloWithObject:(id)otherObject;

- (NSNumber *)R_numberValue;
- (BOOL)R_booleanValue;



@end





@interface NSObject (ROperators_Override)


- (id)R_minus;
- (id)R_plus:(id)other;
- (id)R_minus:(id)other;
- (id)R_multiply:(id)other;
- (id)R_divide:(id)other;
- (id)R_modulo:(id)other;


@end


