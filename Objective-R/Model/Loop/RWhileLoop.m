//
//  RWhileLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RWhileLoop.h"
#import "ROperation.h"










@implementation RWhileLoop





#pragma mark - Build Time


- (NSString *)code {
    return [NSString stringWithFormat:@"while (%@) %@", [self.condition code], [self.expression code]];
}





#pragma mark - Run Time


- (id)evaluateInProcess:(RProcess *)process {
    id result = nil;
    while ( [[self.condition evaluateInProcess:process] R_booleanValue] ) {
        result = [self.expression evaluateInProcess:process];
    }
    return result;
}





@end


