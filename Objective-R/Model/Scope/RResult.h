//
//  RResult.h
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RResult : RExpression



#define RLast     [RResult last]
+ (RResult *)last;

- (id)evaluateInScope:(RScope *)scope;



@end


