//
//  RFrame.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"
#import "RScope.h"





@interface RFrame : RThing



- (instancetype)initWithScope:(RScope *)scope parent:(RFrame *)frame;
@property (atomic, readonly, strong) RScope *scope;
@property (atomic, readonly, weak) RFrame *parent;


- (BOOL)createVariableWithName:(NSString *)name;
- (id)variableForName:(NSString *)name;
- (void)setVariableForName:(NSString *)name withValue:(id)value;



@end


