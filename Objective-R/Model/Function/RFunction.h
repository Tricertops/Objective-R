//
//  RFunction.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"
#import "RArgument.h"
#import "RScope.h"





@interface RFunction : RThing



@property (atomic, readwrite, copy) NSString *name;
@property (atomic, readwrite, copy) NSArray *arguments;
@property (atomic, readwrite, strong) RScope *implementation;



@end


