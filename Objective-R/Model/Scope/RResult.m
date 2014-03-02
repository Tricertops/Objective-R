//
//  RResult.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RResult.h"
#import "RScope.h"










@implementation RResult





+ (RResult *)last {
    return [[RResult alloc] init];
}


- (id)evaluateInScope:(RScope *)scope {
    return scope.result;
}





@end


