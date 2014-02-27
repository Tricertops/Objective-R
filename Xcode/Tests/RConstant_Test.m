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





- (void)test_RConst {
    RConstant *constant = RConst(@5);
    XCTAssertEqualObjects(constant.value, @5);
}


- (void)test_evaluateInScope {
    id result = [RConst(@5) evaluateInScope:nil];
    XCTAssertEqualObjects(result, @5);
}


- (void)test_replaceConstantsInArray {
    NSArray *array = @[ @1, @2, RConst(@3), @4, RConst(@5) ];
    NSArray *result = [RConstant replaceConstantsInArray:[array mutableCopy]];
    for (id object in result) {
        XCTAssertEqualObjects([object class], [RConstant class]);
    }
}





@end


