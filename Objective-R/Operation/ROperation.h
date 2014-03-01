//
//  ROperation.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"



typedef enum ROperator : NSUInteger ROperator;





@interface ROperation : RExpression


+ (instancetype)unary:(ROperator)operator of:(RExpression *)operand;
+ (instancetype)left:(RExpression *)operand binary:(ROperator)operator right:(RExpression *)operand;
+ (instancetype)multiary:(ROperator)operator operands:(RExpression *)operand, ... NS_REQUIRES_NIL_TERMINATION;

@property (atomic, readwrite, assign) ROperator operator;
@property (atomic, readwrite, copy) NSArray *operands;


@end





enum ROperator : NSUInteger {
    
    ROperatorPlus,      // 0+x, x+y, (x+y)+z
    ROperatorMinus,     // 0-x, x-y, (x-y)-z
    ROperatorMultiply,  // x*1, x*y, (x*y)*z
    ROperatorDivide,    // x/1, x/y, (x/y)/z
    ROperatorModulo,    // x%2, x%y, (x%y)%z
    
    ROperatorEqualTo,   // x=x, x=y, (x=y)&(y=z)
    ROperatorUnequal,   // x!x, x!y, (x!y)|(y!z)
    ROperatorLessThan,  // x<x, x<y, (x<y)&(y<z)
    ROperatorGreater,   // x>x, x>y, (x>y)&(y>z)
    ROperatorLessThanOrEqual,// <=
    ROperatorGreaterThanOrEqual,// >=
    
    ROperatorNot,       // !x, x!y, (x!y)|(y!z)
    ROperatorAnd,       // x&x, x&y, (x&y)&z
    ROperatorOr,        // x|x, x|y, (x|y)|z
};



