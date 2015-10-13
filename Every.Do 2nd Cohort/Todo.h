//
//  Todo.h
//  Every.Do 2nd Cohort
//
//  Created by Yazan Khayyat on 2015-10-13.
//  Copyright © 2015 Yazan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic ,strong) NSString *todoTitle;
@property (nonatomic ,strong) NSString *todoDescription;
@property (nonatomic ,assign) int priorityNumber;
@property (nonatomic ,assign) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title andDescription:(NSString *)description andPriority:(int)priorityNumber isCompleted:(BOOL)isCompleted;

@end
