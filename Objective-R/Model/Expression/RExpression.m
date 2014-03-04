//
//  RExpression.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSException;
#import "RExpression.h"
#import "RConstant.h"










@implementation RExpression





#pragma mark - Build


+ (RExpression *)expressionFrom:(id)value {
    if ([value isKindOfClass:[RExpression class]]) return value;
    else return [RConstant constant:value];
}


+ (NSArray *)arrayOfExpressionFrom:(NSArray *)values {
    NSMutableArray *expressions = [[NSMutableArray alloc] init];
    for (id value in values) {
        [expressions addObject:[RExpression expressionFrom:value]];
    }
    return expressions;
}



- (NSString *)code {
    return @"<?>";
}





#pragma mark - Run Time


- (id)evaluateInProcess:(__unused RProcess *)process {
    NSAssert(NO, @"Abstract imlpementation.");
    return nil;
}





@end


