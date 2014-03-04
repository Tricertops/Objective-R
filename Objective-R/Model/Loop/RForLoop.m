//
//  RForLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RForLoop.h"
#import "ROperation.h"
#import "RProcess.h"










@implementation RForLoop





#pragma mark - Build Time


- (NSString *)code {
    return [NSString stringWithFormat:@"for (%@, %@, %@) %@", [self.initializer code], [self.condition code], [self.step code], [self.expression code]];
}





#pragma mark - Run Time


- (id)evaluateInProcess:(RProcess *)process {
    RFrame *frame = [process.currentCall pushFrameForScope:nil variables:nil];
    
    id result = nil;
    for ([self.initializer evaluateInProcess:process];
         [[self.condition evaluateInProcess:process] R_booleanValue];
         [self.step evaluateInProcess:process]) {
        
        result = [self.expression evaluateInProcess:process];
    }
    
    [process.currentCall popFrame:frame];
    return result;
}





@end


