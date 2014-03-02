//
//  RProgram.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"
#import "RScope.h"





@interface RProgram : RThing



@property (atomic, readwrite, strong) RScope *main;



@end


