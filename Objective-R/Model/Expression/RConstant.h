//
//  RConstant.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSNull;
#import "RExpression.h"





@interface RConstant : RExpression



#pragma mark - Build Time

#define R(VALUE)        [RConstant constant:VALUE]
#define RVoid           [RConstant constant:nil]
#define RNull           [RConstant constant:[NSNull null]]
+ (instancetype)constant:(id)value;

@property (atomic, readwrite, copy) id value;

- (NSString *)code;



#pragma mark - Run Time

- (id)evaluateInProcess:(RProcess *)process;



@end


