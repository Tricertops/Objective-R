//
//  RConstant.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RConstant : RExpression



+ (instancetype)constant:(id)value;
#define RConst(VALUE)   [RConstant value:VALUE]

@property (atomic, readwrite, copy) id value;

- (id)evaluateInScope:(RScope *)scope;



@end


