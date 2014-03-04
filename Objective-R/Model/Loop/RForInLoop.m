//
//  RForInLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RForInLoop.h"










@implementation RForInLoop





- (NSString *)code {
    return [NSString stringWithFormat:@"for (%@ in %@) %@", [self.storage code], [self.container code], [self.expression code]];
}





@end


