//
//  RBranch.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RBranch : RExpression



+ (RBranch *)if:(RExpression *)condition then:(RExpression *)expression;
+ (RBranch *)if:(RExpression *)condition then:(RExpression *)expression else:(RExpression *)expression;



@end


