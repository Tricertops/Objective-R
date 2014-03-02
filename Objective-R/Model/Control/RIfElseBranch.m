//
//  RIfElseBranch.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RIfElseBranch.h"
#import <ROperators+NSObject.h>










@implementation RIfElseBranch





- (id)evaluateInScope:(RScope *)scope {
    if ( [[self.condition evaluateInScope:scope] R_booleanValue] ) {
        return [self.thenExpression evaluateInScope:scope];
    }
    else {
        return [self.elseExpression evaluateInScope:scope];
    }
}





@end


