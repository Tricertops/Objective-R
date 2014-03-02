//
//  RArgument.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"





@interface RArgument : RThing



#define RArg(NAME, DEFAULT)     [RArgument argument:@#NAME defaultValue:DEFAULT]
+ (RArgument *)argument:(NSString *)name defaultValue:(id)value;

@property (atomic, readwrite, strong) NSString *name;
@property (atomic, readwrite, strong) id defaultValue;



- (NSString *)code;



@end


