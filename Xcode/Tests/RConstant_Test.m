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





- (void)test_evaluation {
    id result = [RConst(@5) evaluateInScope:nil];
    XCTAssertEqualObjects(result, @5);
}





@end


