//
//  RExpression+ROperation.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression+ROperation.h"
#import "ROperation.h"










@implementation RExpression (ROperation)





- (ROperation *)negate {
    return [ROperation unary:ROperatorUnaryMinus of:self];
}





- (ROperation *)plus:(RExpression *)other {
    return [ROperation binary:ROperatorPlus left:self right:other];
}


- (ROperation *)minus:(RExpression *)other {
    return [ROperation binary:ROperatorMinus left:self right:other];
}


- (ROperation *)multiply:(RExpression *)other {
    return [ROperation binary:ROperatorMultiply left:self right:other];
}


- (ROperation *)divide:(RExpression *)other {
    return [ROperation binary:ROperatorDivide left:self right:other];
}


- (ROperation *)modulo:(RExpression *)other {
    return [ROperation binary:ROperatorModulo left:self right:other];
}






- (ROperation *)isEqualTo:(RExpression *)other {
    return [ROperation binary:ROperatorEqualTo left:self right:other];
}


- (ROperation *)isNotEqualTo:(RExpression *)other {
    return [ROperation binary:ROperatorNotEqualTo left:self right:other];
}


- (ROperation *)isLessThan:(RExpression *)other {
    return [ROperation binary:ROperatorLessThan left:self right:other];
}


- (ROperation *)isGreaterThan:(RExpression *)other {
    return [ROperation binary:ROperatorGreaterThan left:self right:other];
}


- (ROperation *)isLessThanOrEqualTo:(RExpression *)other {
    return [ROperation binary:ROperatorLessThanOrEqualTo left:self right:other];
}


- (ROperation *)isGreaterThanOrEqualTo:(RExpression *)other {
    return [ROperation binary:ROperatorGreaterThanOrEqualTo left:self right:other];
}





@end


