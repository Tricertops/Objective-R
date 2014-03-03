//
//  RReturn.h
//  Objective-R
//
//  Created by Martin Kiss on 3.3.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

#import "RExpression.h"





@interface RReturn : RExpression



@property (atomic, readwrite, strong) RExpression *value;



@end


