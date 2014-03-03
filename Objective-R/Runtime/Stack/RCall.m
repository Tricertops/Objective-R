//
//  RCall.m
//  Objective-R
//
//  Created by Martin Kiss on 2.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSException;
#import "RCall.h"





@interface RCall ()



@property (atomic, readonly, copy) NSMutableArray *frames;



@end










@implementation RCall





- (instancetype)initWithFunction:(RFunction *)function parent:(RCall *)parent {
    self = [super init];
    if (self) {
        NSParameterAssert(function);
        
        self->_function = function;
        self->_parent = parent;
        
        self->_frames = [[NSMutableArray alloc] init];
        
    }
    return self;
}





- (RFrame *)pushFrameForScope:(RScope *)scope {
    RFrame *frame = [[RFrame alloc] initWithScope:scope parent:self.frames.lastObject];
    [self.frames addObject:frame];
    return frame;
}


- (BOOL)popFrame:(RFrame *)frameToPop {
    RFrame *topFrame = [self.frames lastObject];
    
    BOOL isTopFrame = (topFrame == frameToPop);
    NSAssert(isTopFrame, @"Cannot pop what is not on top. Top is: %@", topFrame);
    if( ! isTopFrame) return NO;
    
    [self.frames removeLastObject];
    return YES;
}





@end


