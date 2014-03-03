//
//  RProcess.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSException;
#import "RProcess.h"





@interface RProcess ()



@property (atomic, readwrite, copy) NSMutableArray *callStack;



@end










@implementation RProcess





- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        
        self->_queue = queue ?: ({
            NSOperationQueue *queue = [[NSOperationQueue alloc] init];
            queue.name = [NSString stringWithFormat:@"com.Triceratops.Objective-R.RProcess-%p", self];
            queue.maxConcurrentOperationCount = 1;
            queue;
        });
        
        self->_callStack = [[NSMutableArray alloc] init];
    }
    return self;
}





- (void)executeWithArguments:(NSDictionary *)arguments {
    
}





- (RCall *)currentCall {
    return self.callStack.lastObject;
}


- (RCall *)pushCallForFunction:(RFunction *)function arguments:(NSDictionary *)arguments {
    RCall *call = [[RCall alloc] initWithFunction:function arguments:arguments parent:self.callStack.lastObject];
    [self.callStack addObject:call];
    return call;
}


- (BOOL)popCall:(RCall *)callToPop {
    RCall *topCall = [self.callStack lastObject];
    
    BOOL isTopCall = (topCall == callToPop);
    NSAssert(isTopCall, @"Cannot pop what is not on top. Top is: %@", topCall);
    if( ! isTopCall) return NO;
    
    [self.callStack removeLastObject];
    return YES;
}





@end










@implementation RFunction (RProcess)





- (id)invokeWithArguments:(NSDictionary *)arguments {
    RProcess *process = [[RProcess alloc] initWithFunction:self queue:[NSOperationQueue currentQueue]];
    [process executeWithArguments:arguments];
    return process.result;
}





@end


