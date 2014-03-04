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



+ (RFunction *)function:(NSString *)name arguments:(NSArray *)args implementation:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION;
+ (RExpression *)return:(RExpression *)value;

@property (atomic, readwrite, copy) NSString *name;
@property (atomic, readwrite, copy) NSArray *arguments;
@property (atomic, readwrite, strong) RExpression *implementation;




- (NSString *)code;



@end


