//
//  RConstant.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RConstant.h"





@implementation RConstant





+ (instancetype)constant:(id)value {
    RConstant *constant = [[self alloc] init];
    constant.value = value;
    return constant;
}


- (id)evaluateInScope:(RScope *)scope {
    return self.value;
}





@end


