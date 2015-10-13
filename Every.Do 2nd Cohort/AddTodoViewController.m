
//
//  AddTodoViewController.m
//  Every.Do 2nd Cohort
//
//  Created by Yazan Khayyat on 2015-10-13.
//  Copyright © 2015 Yazan. All rights reserved.
//

#import "AddTodoViewController.h"
#import "Todo.h"

@interface AddTodoViewController ()

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.delegate addTodo:self withData:[Todo new]];
    self.todoTitleTextField.placeholder = @"Title";
    self.todoDescriptionTextField.placeholder = @"Your Description";
    self.priorityLevelTextField.placeholder = @"Priority Level";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    
    Todo *obj = [[Todo alloc]init];
    obj.todoDescription = self.todoDescriptionTextField.text;
    obj.todoTitle = self.todoTitleTextField.text;
    obj.priorityNumber = [self.priorityLevelTextField.text intValue];
    
//
//    Todo *obj = [[Todo alloc]init];
//    obj.todoDescription = @"test1";
//    obj.todoTitle = @"test2";
//    obj.priorityNumber = 12;
    
    [self.delegate addTodo:self withData:obj];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
