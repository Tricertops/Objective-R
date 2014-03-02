//
//  RArgument.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"





@interface RArgument : RThing



@property (atomic, readwrite, strong) NSString *name;
@property (atomic, readwrite, strong) id defaultValue;



@end


