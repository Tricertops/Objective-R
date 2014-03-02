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



@property (atomic, readonly, strong) RScope *scope;
@property (atomic, readonly, weak) RFrame *parent;

@property (atomic, readonly, copy) NSDictionary *variables;
//TODO: - (BOOL)createVariableWithName:(NSString *)name initialValue:(id)value;
//TODO: - (id)variableForName:(NSString *)name;
//TODO: - (void)setVariableForName:(NSString *)name value:(id)value;


@end


