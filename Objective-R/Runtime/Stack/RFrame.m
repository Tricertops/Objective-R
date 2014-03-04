//
//  RFrame.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSException;
@import Foundation.NSDictionary;
@import Foundation.NSNull;
#import "RFrame.h"





@interface RFrame ()



@property (atomic, readonly, strong) NSMutableDictionary *variables;



@end










@implementation RFrame





- (instancetype)initWithScope:(RScope *)scope variables:(NSDictionary *)variables parent:(RFrame *)parent {
    self = [super init];
    if (self) {
        self->_scope = scope;
        self->_parent = parent;
        
        self->_variables = [[NSMutableDictionary alloc] initWithDictionary:variables];
    }
    return self;
}





- (BOOL)createVariableWithName:(NSString *)name {
    BOOL isNotYetCreated = ([self.variables objectForKey:name] == nil);
    if (isNotYetCreated) {
        [self.variables setObject:NSNull.null forKey:name];
    }
    return isNotYetCreated;
}


- (id)variableForName:(NSString *)name {
    id value = [self.variables objectForKey:name];
    return value ?: [self.parent variableForName:name];
}


- (void)setVariableForName:(NSString *)name withValue:(id)value {
    BOOL isCreated = ([self.variables objectForKey:name] != nil);
    if (isCreated) {
        [self.variables setObject:value forKey:name];
    }
    else {
        [self.parent setVariableForName:name withValue:value];
    }
}





@end


