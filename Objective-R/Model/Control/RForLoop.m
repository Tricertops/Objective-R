//
//  RForLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RForLoop.h"










@implementation RForLoop





- (NSString *)code {
    return [NSString stringWithFormat:@"for (%@; %@; %@) %@", [self.initializer code], [self.condition code], [self.step code], [self.expression code]];
}





@end


