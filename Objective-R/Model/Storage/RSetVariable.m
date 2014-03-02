//
//  RSetVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RSetVariable.h"










@implementation RSetVariable





- (RVariable *)create:(RExpression *)initialValue {
    return [self.variable create:initialValue];
}


- (RVariable *)setTo:(RExpression *)value {
    return [self.variable setTo:value];
}





- (RVariable *)incrementBy:(RExpression *)value {
    return [self.variable incrementBy:value];
}





@end


