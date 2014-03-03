//
//  RStorageOperation.m
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RStorageOperation.h"










@implementation RStorageOperation





- (NSString *)code {
    BOOL isOne = ([self.operand isKindOfClass:[RConstant class]] && [[(RConstant *)self.operand value] isEqual:@1] );
    if (isOne) {
        if (self.operator == ROperatorStorageIncrementBy) {
            return [NSString stringWithFormat:@"%@++", [self.storage code]];
        }
        if (self.operator == ROperatorStorageDecrementBy) {
            return [NSString stringWithFormat:@"%@−−", [self.storage code]];
        }
    }
    return [NSString stringWithFormat:@"%@ %@ %@", [self.storage code], [[ROperation stringsForOperator:self.operator] firstObject], [self.operand code]];
}





@end


