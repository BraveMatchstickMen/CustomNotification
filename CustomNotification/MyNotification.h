//
//  MyNotification.h
//  CustomNotification
//
//  Created by 柴勇峰 on 12/13/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief  关于通知的信息
 */
@interface MyNotification : NSObject

@property (nonatomic, strong, readwrite) NSString *name;

@property (nonatomic, assign, readwrite) id object;

@property (nonatomic, strong, readwrite) NSDictionary *infoDictionary;

- (id)initWithName:(NSString *)name object:(id)anObject userInfo:(NSDictionary *)someUserInfo;

@end
