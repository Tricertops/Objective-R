//
//  RSetVariable.h
//  Objective-R
//
//  Created by Martin Kiss on 4.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RSetStorage.h"
#import "RVariable.h"





@interface RSetVariable : RSetStorage



@property (atomic, readwrite, assign) BOOL shouldCreate;
@property (atomic, readwrite, strong) RVariable *storage;



@end


