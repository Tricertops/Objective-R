//
//  RExpression+ROperation.h
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "ROperation.h"





@interface RExpression (ROperation)



- (ROperation *)negate;

- (ROperation *)plus:(RExpression *)other;
- (ROperation *)minus:(RExpression *)other;
- (ROperation *)multiply:(RExpression *)other;
- (ROperation *)divide:(RExpression *)other;
- (ROperation *)modulo:(RExpression *)other;

- (ROperation *)isEqualTo:(RExpression *)other;
- (ROperation *)isNotEqualTo:(RExpression *)other;
- (ROperation *)isLessThan:(RExpression *)other;
- (ROperation *)isGreaterThan:(RExpression *)other;
- (ROperation *)isLessThanOrEqualTo:(RExpression *)other;
- (ROperation *)isGreaterThanOrEqualTo:(RExpression *)other;



@end


