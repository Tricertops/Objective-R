//
//  RIfElseBranch.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RIfElseBranch.h"
#import "ROperation.h"










@implementation RIfElseBranch





#pragma mark - Build Time


- (NSString *)code {
    return [NSString stringWithFormat:@"if %@ then %@ else %@", [self.condition code], [self.thenExpression code], [self.elseExpression code]];
}





#pragma mark - Run Time


- (id)evaluateInProcess:(RProcess *)process {
    if ( [[self.condition evaluateInProcess:process] R_booleanValue] ) {
        return [self.thenExpression evaluateInProcess:process];
    }
    else {
        return [self.elseExpression evaluateInProcess:process];
    }
}





@end


