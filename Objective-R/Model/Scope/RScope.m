//
//  RScope.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RScope.h"
#import "RConstant.h"
#import "RProcess.h"





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





- (id)evaluateInProcess:(RProcess *)process {
    RFrame *frame = [process.currentCall pushFrameForScope:self variables:nil];
    
    id result = nil;
    for (RExpression *exp in self.expressions) {
        result = [exp evaluateInProcess:process];
    }
    
    [process.currentCall popFrame:frame];
    return result;
}





- (NSString *)code {
    if (self.expressions.count == 0) {
        return @"{ }";
    }
    else if (self.expressions.count == 1) {
        NSMutableString *builder = [[NSMutableString alloc] init];
        [builder appendString:@"\n"];
        for (NSUInteger index = 0; index < 4; index++) {
            [builder appendString:@" "];
        }
        [builder appendString:[self.expressions.firstObject code]];
        return builder;
    }
    else {
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
}






@end


