//
//  RWhileLoop.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RLoop.h"





@interface RWhileLoop : RLoop



#pragma mark - Build Time

@property (atomic, readwrite, strong) RExpression *condition;
@property (atomic, readwrite, strong) RExpression *expression;

- (NSString *)code;


#pragma mark - Run Time

- (id)evaluateInProcess:(RProcess *)process;



@end


