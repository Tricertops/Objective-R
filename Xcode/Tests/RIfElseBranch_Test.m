//
//  RIfElseBranch_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "RConstant.h"
#import "RIfElseBranch.h"
#import "RScope.h"





@interface RIfElseBranch_Test : XCTestCase

@end










@implementation RIfElseBranch_Test





- (void)test_creation {
    RConstant *yes = R(@YES);
    RConstant *three = R(@3);
    RConstant *five = R(@5);
    RIfElseBranch *branch = (RIfElseBranch *)[RBranch if:yes then:three else:five];
    XCTAssertEqualObjects(branch.class, [RIfElseBranch class]);
    XCTAssertEqual(branch.condition, yes);
    XCTAssertEqual(branch.thenExpression, three);
    XCTAssertEqual(branch.elseExpression, five);
}


- (void)test_evaluation {
    RIfElseBranch *branch = [[RIfElseBranch alloc] init];
    branch.thenExpression = R(@3);
    branch.elseExpression = R(@5);
    {
        branch.condition = R(@YES);
        id result = [branch evaluateInScope:nil];
        XCTAssertEqualObjects(result, @3);
    }{
        branch.condition = R(@NO);
        id result = [branch evaluateInScope:nil];
        XCTAssertEqualObjects(result, @5);
    }{
        branch.condition = nil;
        id result = [branch evaluateInScope:nil];
        XCTAssertEqualObjects(result, @5); //TODO: Maybe nil?
    }
}





@end


