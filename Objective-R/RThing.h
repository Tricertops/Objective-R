//
//  RThing.h
//  Objective-R
//
//  Created by Martin Kiss on 27.2.14.
//  Copyright (c) 2014 Triceratops Software, s.r.o. All rights reserved.
//

@import Foundation.NSObject;
@import Foundation.NSArray;





@interface RThing : NSObject

@end





#define RVariadicArray(FIRST)\
(NSMutableArray *)({ \
    va_list list; \
    va_start(list, FIRST); \
    NSMutableArray *array = [[NSMutableArray alloc] init]; \
    id object = FIRST; \
    while (object) { \
        [array addObject:object]; \
        object = va_arg(list, id); \
    } \
    va_end(list); \
    array; \
})


