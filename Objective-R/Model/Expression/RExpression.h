//
//  RExpression.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSString;
#import "RThing.h"
@class RScope;
@class RProcess;





@interface RExpression : RThing


- (id)evaluateInProcess:(RProcess *)process;
- (id)evaluateInScope:(RScope *)scope __deprecated;



- (NSString *)code;



@end


