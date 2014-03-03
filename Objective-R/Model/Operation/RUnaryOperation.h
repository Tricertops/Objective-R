//
//  RUnaryOperation.h
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "ROperation.h"





@interface RUnaryOperation : ROperation



@property (atomic, readwrite, assign) RUnaryOperator operator;
@property (atomic, readwrite, strong) RExpression *operand;

- (id)evaluateInProcess:(RProcess *)process;



- (NSString *)code;



@end


