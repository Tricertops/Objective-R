//
//  RSetVariable.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RVariable.h"





@interface RSetVariable : RVariable



@property (atomic, readwrite, assign) BOOL shouldCreate;
@property (atomic, readwrite, strong) RVariable *variable;
@property (atomic, readwrite, strong) RExpression *value;


- (RVariable *)create:(RExpression *)initialValue;
- (RVariable *)setTo:(RExpression *)value;

- (RVariable *)incrementBy:(RExpression *)value;



@end


