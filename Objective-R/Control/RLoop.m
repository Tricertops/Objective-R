//
//  RLoop.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RLoop.h"
#import "RWhileLoop.h"










@implementation RLoop





+ (RLoop *)while:(RExpression *)condition do:(RExpression *)expression {
    RWhileLoop *loop = [[RWhileLoop alloc] init];
    loop.condition = condition;
    loop.expression = expression;
    return loop;
}





@end


