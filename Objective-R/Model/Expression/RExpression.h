//
//  RExpression.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSString;
#import "RThing.h"
@class RProcess;





@interface RExpression : RThing



#pragma mark - Build

+ (RExpression *)expressionFrom:(id)value;
+ (NSArray *)arrayOfExpressionFrom:(NSArray *)values;

- (NSString *)code;



#pragma mark - Run Time

- (id)evaluateInProcess:(RProcess *)process;



@end


