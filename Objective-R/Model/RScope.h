//
//  RScope.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSArray;
#import "RExpression.h"





@interface RScope : RExpression



+ (instancetype)scope:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION;

@property (atomic, readwrite, copy) NSArray *expressions;


- (id)evaluateInScope:(RScope *)scope;

@property (atomic, readonly, weak) RScope *parent;
@property (atomic, readonly, strong) id result;


- (NSString *)code;


@end


