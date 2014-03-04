//
//  RForInLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RForInLoop.h"
#import "RProcess.h"










@implementation RForInLoop





#pragma mark - Build Time


- (NSString *)code {
    return [NSString stringWithFormat:@"for ($%@ in %@) %@", [self.variable code], [self.container code], [self.expression code]];
}





#pragma mark - Run Time


- (id)evaluateInProcess:(RProcess *)process {
    //TODO: Define the variable
    id result = nil;
    for (NSObject *value in [process resultOfExpression:self.container]) {
        //TODO: Set the variable
        result = [process resultOfExpression:self.expression];
    }
    return result;
}





@end


