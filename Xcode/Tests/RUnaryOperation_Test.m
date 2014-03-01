//
//  RUnaryOperation_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "RUnaryOperation.h"





@interface RUnaryOperation_Test : XCTestCase

@end










@implementation RUnaryOperation_Test





- (void)test_creation {
    RConstant *c = R(@5);
    RUnaryOperation *op = (RUnaryOperation *)[ROperation unary:ROperatorUnaryPlus of:c];
    XCTAssertEqualObjects(op.class, [RUnaryOperation class]);
    XCTAssertEqual(op.operator, ROperatorUnaryPlus);
    XCTAssertEqual(op.operand, c);
    XCTAssertEqualObjects(op.operands, @[c]);
}





- (void)test_unaryPlus {
    RUnaryOperation *op = [[RUnaryOperation alloc] init];
    op.operator = ROperatorUnaryPlus;
    {
        op.operand = R(@5);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @5);
    }{
        op.operand = R(@-5);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @-5);
    }
}


- (void)test_unaryMinus {
    RUnaryOperation *op = [[RUnaryOperation alloc] init];
    op.operator = ROperatorUnaryMinus;
    {
        op.operand = R(@5);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @-5);
    }{
        op.operand = R(@-5);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @5);
    }
}


- (void)test_not {
    RUnaryOperation *op = [[RUnaryOperation alloc] init];
    op.operator = ROperatorNot;
    {
        op.operand = R(@YES);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.operand = R(@NO);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.operand = R(@"ABC");
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @NO, @"Objects are negated to NO.");
    }{
        op.operand = R(NSNull.null);
        id result = [op evaluateInScope:nil];
        XCTAssertEqualObjects(result, @YES, @"NSNull represents NO, so is negated to YES.");
    }
}





- (void)test_nil {
    RUnaryOperation *op = [[RUnaryOperation alloc] init];
    op.operand = RVoid;
    {
        op.operator = ROperatorUnaryPlus;
        id result = [op evaluateInScope:nil];
        XCTAssertNil(result);
    }{
        op.operator = ROperatorUnaryMinus;
        id result = [op evaluateInScope:nil];
        XCTAssertNil(result);
    }{
        op.operator = ROperatorNot;
        id result = [op evaluateInScope:nil];
        XCTAssertNil(result, @"Nil is not negated and stays nil.");
    }
}





@end


