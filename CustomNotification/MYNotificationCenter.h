//
//  MYNotificationCenter.h
//  CustomNotification
//
//  Created by 柴勇峰 on 12/13/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNotification.h"

/**
 *  @brief 单例模式 处理通知的中枢
 */
@interface MYNotificationCenter : NSObject

@property (nonatomic, strong) NSMutableDictionary *observersDictionary;

- (id)defaultCenter;

- (void)addObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(id)objectOfInterest;

- (void)removeObserver:(id)notificationObserver;

- (void)postNotification:(MyNotification *)aNotification;

- (void)postNotification:(NSString *)aName object:(id)objectOfInterest userInfo:(NSDictionary *)someUserInfo;

@end
