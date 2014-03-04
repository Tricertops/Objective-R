//
//  RSetVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 4.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RSetVariable.h"
#import "RProcess.h"










@implementation RSetVariable





- (id)evaluateInProcess:(RProcess *)process {
    RVariable *variable = self.storage;
    RFrame *frame = process.currentCall.currentFrame;
    
    [frame createVariableWithName:variable.name];
    
    id result = [self.value evaluateInProcess:process];
    [frame setVariableForName:variable.name withValue:result];
    
    return result;
}





- (NSString *)code {
    return [NSString stringWithFormat:@"%@%@", (self.shouldCreate? @"def " : @""), [super code]];
}





@end


