//
//  RProcess.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSOperation;
#import "RThing.h"
#import "RFunction.h"
#import "RCall.h"





@interface RProcess : RThing
//TODO: sandbox, debugger, delegate



- (instancetype)initWithQueue:(NSOperationQueue *)queue;
@property (atomic, readonly, strong) NSOperationQueue *queue;


- (id)execute;
- (void)executeWithCompletion:(void(^)(id))handler;



- (id)resultOfExpression:(RExpression *)expression;

@property (atomic, readwrite, strong) id result;

@property (atomic, readonly, strong) RCall *currentCall;
- (RCall *)pushCallForFunction:(RFunction *)function  arguments:(NSDictionary *)arguments;
- (BOOL)popCall:(RCall *)call;



@end





@interface RFunction (RProcess)


- (id)invokeWithArguments:(NSDictionary *)arguments;


@end





@interface RExpression (RProcess)


- (id)evaluate;


@end


