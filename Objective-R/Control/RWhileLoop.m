//
//  RWhileLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RWhileLoop.h"
#import <ROperators+NSObject.h>










@implementation RWhileLoop





- (id)evaluateInScope:(RScope *)scope {
    id result = nil;
    while ( [[self.expression evaluateInScope:scope] R_booleanValue] ) {
        result = [self.expression evaluateInScope:scope];
    }
    return result;
}





@end


