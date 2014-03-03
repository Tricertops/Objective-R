//
//  RCall.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"
#import "RFunction.h"
#import "RFrame.h"





@interface RCall : RThing



- (instancetype)initWithFunction:(RFunction *)function arguments:(NSDictionary *)arguments parent:(RCall *)call;
@property (atomic, readonly, strong) RFunction *function;
@property (atomic, readonly, weak) RCall *parent;


@property (atomic, readonly, strong) RFrame *currentFrame;
- (RFrame *)pushFrameForScope:(RScope *)scope variables:(NSDictionary *)variables;
- (BOOL)popFrame:(RFrame *)frame;



@end


