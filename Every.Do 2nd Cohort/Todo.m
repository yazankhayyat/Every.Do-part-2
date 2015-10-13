//
//  Todo.m
//  Every.Do 2nd Cohort
//
//  Created by Yazan Khayyat on 2015-10-13.
//  Copyright © 2015 Yazan. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title andDescription:(NSString *)description andPriority:(int)priorityNumber isCompleted:(BOOL)isCompleted
{
    self = [super init];
    if (self) {
        _todoTitle = title;
        _todoDescription = description;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
    }
    return self;
}

@end
