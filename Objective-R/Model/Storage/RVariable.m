//
//  RVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RVariable.h"
#import "RSetVariable.h"
#import "RProcess.h"










@implementation RVariable





+ (RExpression *)variable:(NSString *)name {
    RVariable *variable = [[RVariable alloc] init];
    variable.name = name;
    return variable;
}


- (RExpression *)create:(RExpression *)initialValue {
    return [self setTo:initialValue create:YES];
}


- (RExpression *)setTo:(RExpression *)value {
    return [self setTo:value create:NO];
}


- (RExpression *)setTo:(RExpression *)value create:(BOOL)create {
    RSetVariable *creation = [[RSetVariable alloc] init];
    creation.shouldCreate = create;
    creation.storage = self;
    creation.value = value;
    return creation;
}





- (id)evaluateInProcess:(RProcess *)process {
    return [process.currentCall.currentFrame variableForName:self.name];
}






- (NSString *)code {
    return self.name;
}





@end


