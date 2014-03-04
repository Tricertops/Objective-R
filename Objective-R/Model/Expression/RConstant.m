//
//  RConstant.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RConstant.h"










@implementation RConstant





#pragma mark - Build


+ (instancetype)constant:(id)value {
    RConstant *constant = [[self alloc] init];
    constant.value = value;
    return constant;
}



- (NSString *)code {
    if (self.value == nil) return @"void";
    if (self.value == NSNull.null) return @"nil";
    if ([self.value isKindOfClass:[NSNumber class]]) return [self.value description];
    if ([self.value isKindOfClass:[NSString class]]) return [NSString stringWithFormat:@"“%@”", self.value];
    return [NSString stringWithFormat:@"%@:%p", [self.value classForCoder], self.value];
}





#pragma mark - Run Time


- (id)evaluateInProcess:(__unused RProcess *)process {
    return self.value;
}





@end


