//
//  AddTodoViewController.h
//  Every.Do 2nd Cohort
//
//  Created by Yazan Khayyat on 2015-10-13.
//  Copyright © 2015 Yazan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@class Todo;
@class AddTodoViewController;

@protocol AddTodoDelegate <NSObject>
-(void)addTodo:(AddTodoViewController *)addTodo withData:(Todo *)todoObj;
@end

@interface AddTodoViewController : UIViewController

@property (weak, nonatomic) id <AddTodoDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *todoTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *todoDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityLevelTextField;

@end


