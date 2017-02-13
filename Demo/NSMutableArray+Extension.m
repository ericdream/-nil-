//
//  NSMutableArray+Extension.m
//  Share
//
//  Created by apple_Eric on 13/02/2017.
//  Copyright © 2017 apple. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>
@implementation NSMutableArray (Extension)
+ (void)load{
    Method oldMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(gb_addObject:));
    method_exchangeImplementations(oldMethod, newMethod);
}
- (void)gb_addObject:(id)object{
    if(object != nil){
        [self gb_addObject:object]; // 调用 addObject 会死循环
    }
}
@end
