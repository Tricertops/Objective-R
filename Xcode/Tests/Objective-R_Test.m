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





- (void)test_ {
    [RFunction function:@"factorial"
              arguments:@[ RArg(n, @0) ]
         implementation:
     [RVar(result) create:@1],
//     [RLoop for:RVar(i) from:@1 to:RVar(n) do:
//      [[RVar(result) multiply:RVar(i)]
//       storeIn:RVar(result)],
//      ],
//     [RFunction return:RVar(result)],
     nil];
}




@end


