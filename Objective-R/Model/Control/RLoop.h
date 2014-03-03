//
//  RLoop.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "RStorage.h"





@interface RLoop : RExpression



+ (RLoop *)while:(RExpression *)condition do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION;

+ (RLoop *)for:(RExpression *)initializer condition:(RExpression *)condition step:(RExpression *)step do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION;
+ (RLoop *)for:(RStorage *)iterator from:(RExpression *)fromValue to:(RExpression *)toValue do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION;

+ (RLoop *)for:(RStorage *)iterator in:(RExpression *)container do:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION;



@end


