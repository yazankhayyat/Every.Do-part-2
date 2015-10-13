//
//  MasterViewController.m
//  Every.Do 2nd Cohort
//
//  Created by Yazan Khayyat on 2015-10-13.
//  Copyright © 2015 Yazan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "MyTableViewCell.h"
#import "AddTodoViewController.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, AddTodoDelegate>

@property (nonatomic ,strong) NSMutableArray *arrayOfTodos;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTodoList];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
//    if (!self.arrayOfTodos) {
//        self.arrayOfTodos = [[NSMutableArray alloc] init];
//    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self performSegueWithIdentifier:@"addTodoSegue" sender:self];
    
 //   [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.arrayOfTodos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    else if ([[segue identifier] isEqualToString:@"addTodoSegue"]){
        AddTodoViewController *controller = (AddTodoViewController *)[segue destinationViewController];
        controller.delegate = self;
        
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfTodos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

     Todo *object = self.arrayOfTodos[indexPath.row];
    cell.titleLabel.text = object.todoTitle;
    cell.priorityLevelLabel.text = [NSString stringWithFormat:@"%d", object.priorityNumber];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:object.todoDescription];
   
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(translateTo:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeGesture];
    
    if (object.isCompleted) {
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@3 range:NSMakeRange(0, [attributedString length])];
         
        
    }
    
    cell.descriptionLabel.attributedText = attributedString;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayOfTodos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)addTodoList {
    
    Todo *todoTask1 = [[Todo alloc]initWithTitle:@"Pay Phone bill" andDescription:@"Pay the phone bill by Friday" andPriority:6 isCompleted:NO];
    
    Todo *todoTask2 = [[Todo alloc]initWithTitle:@"Grocery shopping" andDescription:@"Get some groceries to cook food tonight" andPriority:8 isCompleted:YES];
    
    Todo *todoTask3 = [[Todo alloc]initWithTitle:@"Complete Assignments" andDescription:@"Complete all the assignments for Lighthouse Labs" andPriority:9 isCompleted:NO];
    
    Todo *todoTask4 = [[Todo alloc]initWithTitle:@"Work out" andDescription:@"Go to the gym after work" andPriority:7 isCompleted:NO];
    
    self.arrayOfTodos = [[NSMutableArray alloc]initWithObjects:todoTask1, todoTask2, todoTask3, todoTask4, nil];
    
}

-(void)translateTo:(UISwipeGestureRecognizer *)aGesture {

   NSIndexPath *ip = [self.tableView indexPathForRowAtPoint:[aGesture locationInView:self.tableView]];
    Todo *obj = self.arrayOfTodos[ip.row];
    obj.isCompleted = !obj.isCompleted;
    [self.tableView reloadData];
    
}

-(void)addTodo:(AddTodoViewController *)addTodo withData:(Todo *)todoObj {
    
    [self.arrayOfTodos insertObject:todoObj atIndex:0];
    [self.tableView reloadData];
}



@end
