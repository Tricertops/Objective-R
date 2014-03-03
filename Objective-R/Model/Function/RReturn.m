//
//  RReturn.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RReturn.h"





@implementation RReturn





- (NSString *)code {
    return [NSString stringWithFormat:@"⇦ %@", [self.value code]];
}





@end


