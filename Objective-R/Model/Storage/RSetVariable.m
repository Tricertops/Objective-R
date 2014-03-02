//
//  RSetVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RSetVariable.h"










@implementation RSetVariable





- (NSString *)name {
    return self.variable.name;
}


- (void)setName:(NSString *)name {
    self.variable.name = name;
}





- (RVariable *)create:(RExpression *)initialValue {
    return [self.variable create:initialValue];
}


- (RVariable *)setTo:(RExpression *)value {
    return [self.variable setTo:value];
}





- (RVariable *)incrementBy:(RExpression *)value {
    return [self.variable incrementBy:value];
}





- (NSString *)code {
    return [NSString stringWithFormat:@"%@%@ ← %@", (self.shouldCreate? @"def " : @""), self.name, [self.value code]];
}





@end


