//
//  MyNotification.m
//  CustomNotification
//
//  Created by 柴勇峰 on 12/13/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import "MyNotification.h"

@implementation MyNotification

- (id)initWithName:(NSString *)name object:(id)anObject userInfo:(NSDictionary *)someUserInfo
{
    [self setName:name];
    
    [self setObject:anObject];
    
    [self setInfoDictionary:someUserInfo];
    
    return self;
}

@end
