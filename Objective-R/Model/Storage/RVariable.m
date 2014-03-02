//
//  RVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RVariable.h"
#import "RSetVariable.h"
#import "ROperation.h"










@implementation RVariable





+ (RExpression *)variable:(NSString *)name {
    RVariable *variable = [[RVariable alloc] init];
    variable.name = name;
    return variable;
}





- (RExpression *)create:(RExpression *)initialValue {
    RSetVariable *creation = [[RSetVariable alloc] init];
    creation.shouldCreate = YES;
    creation.variable = self;
    creation.value = initialValue;
    return creation;
}


- (RExpression *)setTo:(RExpression *)value {
    RSetVariable *setter = [[RSetVariable alloc] init];
    setter.shouldCreate = NO;
    setter.variable = self;
    setter.value = value;
    return setter;
}





- (RExpression *)incrementBy:(RExpression *)value {
    return [self setTo:[self plus:value]];
}





- (NSString *)code {
    return self.name;
}





@end


