//
//  PMAutoPropertyManager.m
//  PMRunTimeObject
//
//  Created by PeiZiming on 15/9/21.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "PMAutoPropertyManager.h"
#import <objc/runtime.h>

@interface PMAutoPropertyManager ()

@property (nonatomic, strong) NSMutableDictionary *autoDictionary;

@end

@implementation PMAutoPropertyManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _autoDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        //setObject
        class_addMethod(self, sel, (IMP) autoDictionarySetter, "v@:@");
    } else {
        //get
        class_addMethod(self, sel, (IMP) autoDictionaryGetter, "@@:");
    }
    return YES;
}

id autoDictionaryGetter(id self, SEL _cmd)
{
    PMAutoPropertyManager *typeSelf = (PMAutoPropertyManager *)self;
    NSMutableDictionary *autoDictionary = typeSelf.autoDictionary;
    NSString *key = NSStringFromSelector(_cmd);
    
    return [autoDictionary objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value)
{
    PMAutoPropertyManager *typeSelf = (PMAutoPropertyManager *)self;
    NSMutableDictionary *autoDictionary = typeSelf.autoDictionary;
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length -1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [autoDictionary setObject:value forKey:key];
    } else {
        [autoDictionary removeObjectForKey:key];
    }
}

@end
