//
//  MYNotificationCenter.m
//  CustomNotification
//
//  Created by 柴勇峰 on 12/13/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import "MYNotificationCenter.h"
#import "MYNotificationObserverRecord.h"

@implementation MYNotificationCenter

- (id)defaultCenter
{
    static id sharedNotificationCenter = nil;
    
    if (!sharedNotificationCenter) {
        
        sharedNotificationCenter = [[MYNotificationCenter alloc] init];
    }
    
    return sharedNotificationCenter;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
       [self setObserversDictionary:[NSMutableDictionary dictionary]];
    }
    
    return self;
    
}

- (void)addObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(id)objectOfInterest
{
    NSParameterAssert(notificationName);
    
    MYNotificationObserverRecord *newRecord = [[MYNotificationObserverRecord alloc] init];
    
    [newRecord setObject:objectOfInterest];
    
    [newRecord setObserver:notificationObserver];
    
    [newRecord setSelector:notificationSelector];
    
    NSMutableArray *observers = [_observersDictionary objectForKey:notificationName];
    
    if (observers) {
        
        [observers addObject:newRecord];
        
    } else {
        
        [_observersDictionary setObject:[NSMutableArray arrayWithObject:newRecord] forKey:notificationName];
    }
}

- (void)removeObserver:(id)notificationObserver
{
    if (notificationObserver) {
        
        for (NSMutableArray *observers in [self observersDictionary]) {
            
            for (NSInteger i = observers.count; i >= 0; i--) {
                
               MYNotificationObserverRecord *currentObserverRecord = [observers objectAtIndex:i];
                
                if (notificationObserver == [currentObserverRecord observer]) {
                    
                    [observers removeObjectAtIndex:i];
                }
            }
        }
    }
}

- (void)postNotification:(MyNotification *)aNotification
{
    NSParameterAssert(aNotification);
    
    NSAssert(![aNotification name], @"nil notification name");
    
    NSArray *observers = [_observersDictionary objectForKey:[aNotification name]];
    
    for (id currentObserverRecord in observers) {
        
        id object = [currentObserverRecord object];
        
        if (!object || object == [aNotification object]) {
            
            [[currentObserverRecord observer] performSelector:[currentObserverRecord selector] withObject:aNotification];
        }
    }
}

- (void)postNotification:(NSString *)aName object:(id)objectOfInterest userInfo:(NSDictionary *)someUserInfo
{
    MyNotification *newNotification = [[MyNotification alloc] initWithName:aName object:objectOfInterest userInfo:someUserInfo];
    
    [self postNotification:newNotification];
}


@end
