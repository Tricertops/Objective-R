//
//  RBinaryOperation_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "RBinaryOperation.h"





@interface RBinaryOperation_Test : XCTestCase

@end










@implementation RBinaryOperation_Test





- (void)test_creation {
    RConstant *left = R(@3);
    RConstant *right = R(@5);
    RBinaryOperation *op = (RBinaryOperation *)[ROperation binary:ROperatorPlus left:left right:right];
    XCTAssertEqualObjects(op.class, [RBinaryOperation class]);
    XCTAssertEqual(op.operator, ROperatorPlus);
    XCTAssertEqual(op.leftOperand, left);
    XCTAssertEqual(op.rightOperand, right);
}





#pragma mark Arithmetic


- (void)test_plus {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorPlus;
    {
        op.leftOperand = R(@5);
        op.rightOperand = R(@3);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @8);
    }
}


- (void)test_minus {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorMinus;
    {
        op.leftOperand = R(@5);
        op.rightOperand = R(@3);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @2);
    }
}


- (void)test_multiply {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorMultiply;
    {
        op.leftOperand = R(@5);
        op.rightOperand = R(@3);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @15);
    }
}


- (void)test_divide {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorDivide;
    {
        op.leftOperand = R(@15);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @3.75);
    }{
        op.leftOperand = R(@5);
        op.rightOperand = R(@0);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @(HUGE_VAL));
    }
}


- (void)test_modulo {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorModulo;
    {
        op.leftOperand = R(@50);
        op.rightOperand = R(@-3.5);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @1);
    }
}





#pragma mark Comparison


- (void)test_equalTo {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorEqualTo;
    {
        op.leftOperand = R(@"ABC");
        op.rightOperand = R(@"abc".uppercaseString);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(NSDate.date);
        op.rightOperand = R(NSDate.date);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@4);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }
}


- (void)test_notEqualTo {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorNotEqualTo;
    {
        op.leftOperand = R(@"ABC");
        op.rightOperand = R(@"abc".uppercaseString);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(NSDate.date);
        op.rightOperand = R(NSDate.date);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(@4);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }
}


- (void)test_lessThan {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorLessThan;
    {
        op.leftOperand = R(@"BBB");
        op.rightOperand = R(@"AAA");
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(NSDate.date);
        op.rightOperand = R(NSDate.date);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(@4);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }
}


- (void)test_greaterThan {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorGreaterThan;
    {
        op.leftOperand = R(@"BBB");
        op.rightOperand = R(@"AAA");
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(NSDate.date);
        op.rightOperand = R(NSDate.date);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@4);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }
}


- (void)test_lessThanOrEqualTo {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorLessThanOrEqualTo;
    {
        op.leftOperand = R(@"BBB");
        op.rightOperand = R(@"AAA");
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(NSDate.date);
        op.rightOperand = R(NSDate.date);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(@4);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }
}


- (void)test_greaterThanOrEqualTo {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorGreaterThanOrEqualTo;
    {
        op.leftOperand = R(@"BBB");
        op.rightOperand = R(@"AAA");
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(NSDate.date);
        op.rightOperand = R(NSDate.date);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@4);
        op.rightOperand = R(@4);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }
}





#pragma mark Logic


- (void)test_and {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorAnd;
    {
        op.leftOperand = R(@NO);
        op.rightOperand = R(@NO);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@YES);
        op.rightOperand = R(@NO);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@NO);
        op.rightOperand = R(@YES);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@YES);
        op.rightOperand = R(@YES);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }
}


- (void)test_or {
    RBinaryOperation *op = [[RBinaryOperation alloc] init];
    op.operator = ROperatorOr;
    {
        op.leftOperand = R(@NO);
        op.rightOperand = R(@NO);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @NO);
    }{
        op.leftOperand = R(@YES);
        op.rightOperand = R(@NO);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(@NO);
        op.rightOperand = R(@YES);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }{
        op.leftOperand = R(@YES);
        op.rightOperand = R(@YES);
        id result = [op evaluateInProcess:nil];
        XCTAssertEqualObjects(result, @YES);
    }
}





#pragma mark Nested


- (void)test_nested_equalTo_plus_divide {
    ROperation *op =[ROperation binary:ROperatorEqualTo
                                  left:[ROperation binary:ROperatorPlus left:R(@5) right:R(@3)]
                                 right:[ROperation binary:ROperatorDivide left:R(@16) right:R(@2)]];
    id result = [op evaluateInProcess:nil];
    XCTAssertEqualObjects(result, @YES);
}





@end


