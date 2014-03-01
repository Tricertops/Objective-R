//
//  NSNumber+ROperators.m
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import <math.h>
#import "ROperators+NSNumber.h"










@implementation NSNumber (ROperators_Override)





- (id)R_minus {
    return @( - [self doubleValue] );
}


- (id)R_plus:(id)other {
    return @( [self doubleValue] + [other doubleValue] );
}


- (id)R_minus:(id)other {
    return @( [self doubleValue] - [other doubleValue] );
}


- (id)R_multiply:(id)other {
    return @( [self doubleValue] * [other doubleValue] );
}


- (id)R_divide:(id)other {
    return @( [self doubleValue] / [other doubleValue] );
}


- (id)R_modulo:(id)other {
    double x = [self doubleValue];
    double y = [other doubleValue];
    long long i = floor(x / y);
    return @( x - i * y );
}





@end


