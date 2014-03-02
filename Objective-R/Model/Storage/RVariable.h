//
//  RVariable.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RVariable : RExpression



#define RVar(NAME)      [RVariable variable:@#NAME]
+ (RVariable *)variable:(NSString *)name;

@property (atomic, readwrite, copy) NSString *name;


- (RExpression *)create:(RExpression *)initialValue;
- (RExpression *)setTo:(RExpression *)value;

- (RExpression *)incrementBy:(RExpression *)value;
- (RExpression *)decrementBy:(RExpression *)value;



- (NSString *)code;



@end


