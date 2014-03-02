//
//  RSetVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RSetVariable.h"










@implementation RSetVariable





- (NSString *)code {
    return [NSString stringWithFormat:@"%@%@ ← %@", (self.shouldCreate? @"def " : @""), self.variable.name, [self.value code]];
}





@end


