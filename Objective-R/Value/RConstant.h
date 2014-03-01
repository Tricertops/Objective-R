//
//  RConstant.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RConstant : RExpression



#define RConst(VALUE)   [RConstant constant:VALUE]
#define R(VALUE)        [RConstant constant:VALUE]
#define RVoid           [RConstant constant:nil]
#define RNull           [RConstant constant:[NSNull null]]
+ (instancetype)constant:(id)value;
+ (NSMutableArray *)replaceConstantsInArray:(NSMutableArray *)array;

@property (atomic, readwrite, copy) id value;

- (id)evaluateInScope:(RScope *)scope;



@end


