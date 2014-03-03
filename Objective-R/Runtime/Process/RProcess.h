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



- (instancetype)initWithFunction:(RFunction *)function queue:(NSOperationQueue *)queue;
@property (atomic, readonly, strong) NSOperationQueue *queue;


- (void)executeWithArguments:(NSDictionary *)arguments;


@property (atomic, readonly, strong) id result;

@property (atomic, readonly, strong) RCall *currentCall;
- (RCall *)pushCallForFunction:(RFunction *)function;
- (BOOL)popCall:(RCall *)call;



@end





@interface RFunction (RProcess)


- (id)invokeWithArguments:(NSDictionary *)arguments;


@end


