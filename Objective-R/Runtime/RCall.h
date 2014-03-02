//
//  RCall.h
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RThing.h"
#import "RFrame.h"





@interface RCall : RThing
//TODO: function


@property (atomic, readonly, weak) RCall *parent;
@property (atomic, readonly, copy) NSArray *frames;
@property (atomic, readonly, strong) RFrame *currentFrame;



@end


