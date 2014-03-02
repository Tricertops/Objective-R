//
//  RScope.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RScope.h"
#import "RConstant.h"





@interface RScope ()


@property (atomic, readwrite, weak) RScope *parent;
@property (atomic, readwrite, strong) id result;


@end





@implementation RScope





+ (instancetype)scope:(RExpression *)expression, ... NS_REQUIRES_NIL_TERMINATION {
    RScope *scope = [[self alloc] init];
    scope.expressions = [RConstant replaceConstantsInArray:RVariadicArray(expression)];
    return scope;
}


- (id)evaluateInScope:(RScope *)scope {
    self.parent = scope;
    self.result = scope.result;
    
    for (RExpression *exp in self.expressions) {
        self.result = [exp evaluateInScope:self];
    }
    
    id result = self.result;
    self.parent = nil;
    self.result = nil;
    return result;
}





- (NSString *)code {
    NSMutableString *code = [[NSMutableString alloc] init];
    [code appendString:@"{\n"];
    for (RExpression *exp in self.expressions) {
        NSString *subcode = [exp code];
        
        NSMutableString *builder = [[NSMutableString alloc] init];
        [subcode enumerateLinesUsingBlock:^(NSString *line, __unused BOOL *stop) {
            
            for (NSUInteger index = 0; index < 4; index++) {
                [builder appendString:@" "];
            }
            [builder appendString:line];
            [builder appendString:@"\n"];
            
        }];
        
        [code appendString:builder];
    }
    [code appendString:@"}"];
    return code;
}






@end


