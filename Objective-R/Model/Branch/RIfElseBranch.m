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





- (id)evaluateInProcess:(RProcess *)process {
    if ( [[self.condition evaluateInProcess:process] R_booleanValue] ) {
        return [self.thenExpression evaluateInProcess:process];
    }
    else {
        return [self.elseExpression evaluateInProcess:process];
    }
}





- (NSString *)code {
    NSString *code = [NSString stringWithFormat:@"if (%@) %@", [self.condition code], [self.thenExpression code]];
    if (self.elseExpression) {
        code = [code stringByAppendingFormat:@" else %@", [self.elseExpression code]];
    }
    return code;
}





@end


