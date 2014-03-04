//
//  ROperation.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "RConstant.h"
#import "RStorage.h"
#import "RExpression+ROperation.h"
#import "ROperators+NSObject.h"
#import "ROperators+NSNumber.h"



typedef NSInteger ROperator;
typedef enum RUnaryOperator : ROperator RUnaryOperator;
typedef enum RBinaryOperator : ROperator RBinaryOperator;
typedef enum RStorageOperator : ROperator RStorageOperator;





@interface ROperation : RExpression



#pragma mark - Build Time

+ (ROperation *)unary:(RUnaryOperator)operator of:(id)operand;
+ (ROperation *)binary:(RBinaryOperator)operator left:(id)operand right:(id)operand;
+ (ROperation *)storage:(RStorageOperator)operator left:(RStorage *)storage right:(id)operand;

@property (atomic, readwrite, assign) ROperator operator;

+ (NSArray *)stringsForOperator:(ROperator)operator;



@end





enum RUnaryOperator : ROperator {
    ROperatorUnaryPlus = 0,
    
    ROperatorUnaryMinus = '-',
    ROperatorNot = '!',
};

enum RBinaryOperator : ROperator {
    ROperatorNone = 0,
    
    ROperatorPlus = '+',
    ROperatorMinus = '-',
    ROperatorMultiply = '*',
    ROperatorDivide = '/',
    ROperatorModulo = '%',
    
    ROperatorEqualTo = '=',
    ROperatorNotEqualTo = '!',
    ROperatorLessThan = '<',
    ROperatorGreaterThan = '>',
    ROperatorLessThanOrEqualTo = ROperatorLessThan + ROperatorEqualTo,
    ROperatorGreaterThanOrEqualTo = ROperatorGreaterThan + ROperatorEqualTo,
    
    ROperatorAnd = '&',
    ROperatorOr = '|',
};

enum RStorageOperator : ROperator {
    ROperatorStorageNone = ROperatorNone,
    
    ROperatorStorageIncrementBy = ROperatorPlus + ROperatorEqualTo,
    ROperatorStorageDecrementBy = ROperatorMinus + ROperatorEqualTo,
    
    ROperatorStorageMultiplyBy = ROperatorMultiply + ROperatorEqualTo,
    ROperatorStorageDivideBy = ROperatorDivide + ROperatorEqualTo,
};


