//
//  RSetStorage.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RSetStorage.h"










@implementation RSetStorage





- (NSString *)code {
    return [NSString stringWithFormat:@"%@ ← %@", [self.storage code], [self.value code]];
}





@end


