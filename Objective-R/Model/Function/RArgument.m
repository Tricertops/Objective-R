//
//  RArgument.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RArgument.h"










@implementation RArgument





+ (RArgument *)argument:(NSString *)name defaultValue:(id)value {
    RArgument *argument = [[RArgument alloc] init];
    argument.name = name;
    argument.defaultValue = value;
    return argument;
}





@end


