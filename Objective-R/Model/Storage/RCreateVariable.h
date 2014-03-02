//
//  RCreateVariable.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "RVariable.h"





@interface RCreateVariable : RExpression



@property (atomic, readwrite, strong) RVariable *variable;
@property (atomic, readwrite, strong) id value;



@end


