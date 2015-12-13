//
//  MYNotificationObserverRecord.h
//  CustomNotification
//
//  Created by 柴勇峰 on 12/13/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief  存储关于注册的观察者的信息
 */
@interface MYNotificationObserverRecord : NSObject

@property (nonatomic, assign, readwrite) id object;

@property (nonatomic, assign, readwrite) id observer;

@property (nonatomic, assign, readwrite) SEL selector;

@end
