//
//  Objective-R_Test.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import XCTest;
#import "Objective-R.h"





@interface ObjectiveR_Test : XCTestCase

@end










@implementation ObjectiveR_Test





- (void)test_factorial {
    RFunction *f = [RFunction function:@"factorial"
                             arguments:@[ RArg(n, @0) ]
                        implementation:
                    [RVar(result) create:R(@1)],
                    [RLoop for:RVar(i) from:R(@1) to:RVar(n) do:
                     [RVar(result) setTo:[RVar(result) multiply:RVar(i)]],
                     nil],
                    RVar(result),
                    nil];
    NSLog(@"\n\n%@\n\n", [f code]);
    XCTAssertNotNil(f);
}


- (void)test_fibonacci {
    RFunction *f = [RFunction function:@"fibonacci"
                             arguments:@[ RArg(n, @0) ]
                        implementation:
                    [RVar(previous) create:R(@0)],
                    [RVar(current) create:R(@1)],
                    [RLoop for:RVar(i) from:R(@3) to:RVar(n) do:
                     [RVar(next) create:[RVar(previous) plus:RVar(current)]],
                     [RVar(previous) setTo:RVar(current)],
                     [RVar(current) setTo:RVar(next)],
                     nil],
                    RVar(current),
                    nil];
    NSLog(@"\n\n%@\n\n", [f code]);
}


- (void)test_armstrong {
    RFunction *f = [RFunction function:@"armstrong"
                             arguments:@[ RArg(n, @0) ]
                        implementation:
                    [RVar(result) create:R(@0)],
                    [RLoop for:RVar(i) from:R(@1) to:RVar(n) do:
                     [RVar(number) create:RVar(i)],
                     [RVar(sum) create:R(@0)],
                     [RLoop while:[RVar(number) isGreaterThan:R(@0)] do:
                      [RVar(digit) create:[RVar(number) modulo:R(@10)]],
                      [RVar(sum) incrementBy:[RVar(digit) multiply:[RVar(digit) multiply:RVar(digit)]]],
                      [RVar(number) decrementBy:RVar(digit)],
                      [RVar(number) setTo:[RVar(number) divide:R(@10)]],
                      nil],
                     [RBranch if:[RVar(i) isEqualTo:RVar(sum)] then:[RVar(result) setTo:RVar(i)]],
                     nil],
                    RVar(current),
                    nil];
    NSLog(@"\n\n%@\n\n", [f code]);
}




@end


