//
//  RReturn.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RReturn.h"





@implementation RReturn





- (id)evaluateInProcess:(RProcess *)process {
    //TODO: Mark returning.
    return [self.value evaluateInProcess:process];
}





- (NSString *)code {
    return [NSString stringWithFormat:@"⇦ %@", [self.value code]];
}





@end


