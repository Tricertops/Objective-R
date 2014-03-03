//
//  RVariable.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RStorage.h"





@interface RVariable : RStorage



#define RVar(NAME)      [RVariable variable:@#NAME]
+ (RVariable *)variable:(NSString *)name;

@property (atomic, readwrite, copy) NSString *name;



- (NSString *)code;



@end


