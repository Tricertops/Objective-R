//
//  RForInLoop.h
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RLoop.h"
#import "RStorage.h"





@interface RForInLoop : RLoop



@property (atomic, readwrite, strong) RStorage *storage;
@property (atomic, readwrite, strong) RExpression *container;
@property (atomic, readwrite, strong) RExpression *expression;



- (NSString *)code;



@end


