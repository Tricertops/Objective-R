//
//  RStorage.h
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RStorage : RExpression



- (RExpression *)setTo:(RExpression *)value;

- (RExpression *)incrementBy:(RExpression *)value;
- (RExpression *)decrementBy:(RExpression *)value;



@end


