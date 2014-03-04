//
//  RConstant_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "RConstant.h"



@interface RConstant_Test : XCTestCase

@end





@implementation RConstant_Test





- (void)test_R {
    RConstant *constant = R(@5);
    XCTAssertEqualObjects(constant.value, @5);
}


- (void)test_RVoid {
    RConstant *constant = RVoid;
    XCTAssertNotNil(constant);
    XCTAssertNil(constant.value);
}


- (void)test_RNull {
    RConstant *constant = RNull;
    XCTAssertEqualObjects(constant.value, NSNull.null);
}


- (void)test_evaluateInScope {
    id result = [R(@5) evaluateInProcess:nil];
    XCTAssertEqualObjects(result, @5);
}


- (void)test_replaceConstantsInArray {
    NSArray *array = @[ @1, @2, R(@3), @4, R(@5) ];
    NSArray *result = [RExpression arrayOfExpressionFrom:array];
    for (id object in result) {
        XCTAssertEqualObjects([object class], [RConstant class]);
    }
}





@end


