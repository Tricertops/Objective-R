//
//  RExpression.m
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSException;
#import "RExpression.h"










@implementation RExpression





- (id)evaluateInProcess:(__unused RProcess *)process {
    NSAssert(NO, @"Abstract imlpementation.");
    return nil;
}





- (NSString *)code {
    return @"<?>";
}





@end


