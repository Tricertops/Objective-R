//
//  RSetStorage.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"
#import "RStorage.h"





@interface RSetStorage : RExpression



@property (atomic, readwrite, assign) BOOL shouldCreate;
@property (atomic, readwrite, strong) RStorage *storage;
@property (atomic, readwrite, strong) RExpression *value;



- (NSString *)code;



@end


