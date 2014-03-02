//
//  RVariable.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RVariable.h"










@implementation RVariable





+ (RVariable *)variable:(NSString *)name {
    RVariable *variable = [[RVariable alloc] init];
    variable.name = name;
    return variable;
}


- (RExpression *)create:(id)initialValue {
    //TODO: Return RVariableDeclaration
    return self;
}





@end


