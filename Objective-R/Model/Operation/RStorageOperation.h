//
//  RStorageOperation.h
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "ROperation.h"





@interface RStorageOperation : ROperation



@property (atomic, readwrite, assign) RStorageOperator operator;
@property (atomic, readwrite, strong) RStorage *storage;
@property (atomic, readwrite, strong) RExpression *operand;



- (NSString *)code;



@end


