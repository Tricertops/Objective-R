//
//  RProcess.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"
#import "RProgram.h"





@interface RProcess : RThing
//TODO: sandbox, debugger, delegate



@property (atomic, readonly, strong) RProgram *program;

@property (atomic, readonly, strong) id result;
@property (atomic, readonly, copy) NSArray *callStack;



@end


