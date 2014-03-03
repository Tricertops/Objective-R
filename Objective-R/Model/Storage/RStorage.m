//
//  RStorage.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RStorage.h"
#import "RSetStorage.h"
#import "ROperation.h"










@implementation RStorage





- (RExpression *)create:(RExpression *)initialValue {
    RSetStorage *creation = [[RSetStorage alloc] init];
    creation.shouldCreate = YES;
    creation.storage = self;
    creation.value = initialValue;
    return creation;
}


- (RExpression *)setTo:(RExpression *)value {
    RSetStorage *setter = [[RSetStorage alloc] init];
    setter.shouldCreate = NO;
    setter.storage = self;
    setter.value = value;
    return setter;
}





- (RExpression *)incrementBy:(RExpression *)value {
    return [self setTo:[self plus:value]];
}


- (RExpression *)decrementBy:(RExpression *)value {
    return [self setTo:[self minus:value]];
}





@end


