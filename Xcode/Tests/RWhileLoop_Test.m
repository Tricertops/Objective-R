//
//  RWhileLoop_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "RConstant.h"
#import "RWhileLoop.h"
#import "RScope.h"
#import "RResult.h"
#import "RExpression+ROperation.h"





@interface RWhileLoop_Test : XCTestCase

@end










@implementation RWhileLoop_Test





- (void)test_creation {
    RConstant *yes = R(@YES);
    RConstant *three = R(@3);
    RWhileLoop *loop = (RWhileLoop *)[RLoop while:yes do:three];
    XCTAssertEqualObjects(loop.class, [RWhileLoop class]);
    XCTAssertEqual(loop.condition, yes);
    XCTAssertEqual(loop.expression, three);
}


//- (void)test_looping {
//    RScope *scope = [RScope scope:
//                     R(@0),
//                     [RLoop while:[RLast isLessThan:R(@5)] do:[RLast plus:R(@1)]],
//                     nil];
//    id result = [scope evaluateInScope:nil];
//    XCTAssertEqualObjects(result, @4);
//}





@end


