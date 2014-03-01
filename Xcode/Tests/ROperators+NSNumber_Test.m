//
//  ROperators+NSNumber_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "ROperators+NSNumber.h"





@interface ROperators_NSNumber_Test : XCTestCase

@end










@implementation ROperators_NSNumber_Test





- (void)test_unaryMinus {
    XCTAssertEqualObjects(@-5, [@5 R_resultOfUnaryMinus]);
    XCTAssertEqualObjects(@0.5, [@-0.5 R_resultOfUnaryMinus]);
}


- (void)test_plus {
    XCTAssertEqualObjects(@8, [@5 R_resultOfPlusWithObject:@3]);
    XCTAssertEqualObjects(@0.2, [@0.5 R_resultOfPlusWithObject:@-0.3]);
}


- (void)test_minus {
    XCTAssertEqualObjects(@2, [@5 R_resultOfMinusWithObject:@3]);
    XCTAssertEqualObjects(@0.8, [@0.5 R_resultOfMinusWithObject:@-0.3]);
}


- (void)test_multiply {
    XCTAssertEqualObjects(@15, [@5 R_resultOfMultiplyWithObject:@3]);
    XCTAssertEqualObjects(@-0.15, [@0.5 R_resultOfMultiplyWithObject:@-0.3]);
}


- (void)test_divide {
    XCTAssertEqualObjects(@0.6, [@3 R_resultOfDivideWithObject:@5]);
    XCTAssertEqualObjects(@-50, [@-15 R_resultOfDivideWithObject:@0.3]);
}


- (void)test_modulo {
    XCTAssertEqualObjects(@2, [@11 R_resultOfModuloWithObject:@3]);
    NSNumber *modulo = [@-13 R_resultOfModuloWithObject:@0.7];
    XCTAssertEqualWithAccuracy(modulo.doubleValue, -0.4, 1e-15); // Fuck accuracy!
}





@end


