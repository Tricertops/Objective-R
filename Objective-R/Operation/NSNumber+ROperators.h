//
//  NSNumber+ROperators.h
//  Objective-R
//
//  Created by Martin Kiss on 1.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSValue;
#import "NSObject+ROperators.h"





@interface NSNumber (ROperators_Override)



- (id)R_minus;
- (id)R_plus:(id)other;
- (id)R_minus:(id)other;
- (id)R_multiply:(id)other;
- (id)R_divide:(id)other;
- (id)R_modulo:(id)other;



@end


