//
//  RScope_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "RScope.h"
#import "RResult.h"
#import "RConstant.h"
#import "ROperation.h"





@interface RScope_Test : XCTestCase

@end










@implementation RScope_Test





- (void)test_creating {
    RScope *scope = [RScope scope:R(@"ABC"), R(@"DEF"), nil];
    XCTAssertEqual(scope.expressions.count, 2UL);
    id result = [scope evaluateInScope:nil];
    XCTAssertEqualObjects(result, @"DEF");
}


- (void)test_RLast {
    RScope *scope = [RScope scope:
                     [R(@4) multiply:R(@6)],
                     [RLast minus:R(@14)],
                     [R(@3) divide:RLast],
                     nil];
    id result = [scope evaluateInScope:nil];
    XCTAssertEqualObjects(result, @0.3);
}





@end


