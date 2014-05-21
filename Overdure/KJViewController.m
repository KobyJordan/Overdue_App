//
//  KJViewController.m
//  Overdure
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import "KJViewController.h"

@interface KJViewController ()

@end

@implementation KJViewController

-(NSMutableArray *)taskObjects
{
     if (!_taskObjects)
     {
         _taskObjects = [[NSMutableArray alloc] init];
     }
    
    return _taskObjects;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSArray *taskAsPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECT_KEY];
    
    for (NSDictionary *dictionary in taskAsPropertyList)
    {
        KJTasks *taskObject = [self taskObjectForDictionary:dictionary];
        [self.taskObjects addObject:taskObject];
    }
    
  
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[KJAddTaskViewController class]])
    {
        KJAddTaskViewController *addTaskViewController = segue.destinationViewController;
        addTaskViewController.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reorderBarButtonItemPressed:(UIBarButtonItem *)sender
{
    
}

- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddTaskViewControllerSegue" sender:nil];
}

#pragma mark - KJAddTaskViewControllerDelegate

-(void)didAskTask:(KJTasks *)task
{
    [self.taskObjects addObject:task];
    
    NSLog(@"%@", task.title);
    
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECT_KEY] mutableCopy];
    
    if (!taskObjectsAsPropertyLists) taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    [taskObjectsAsPropertyLists addObject:[self taskObjectAsPropertyList:task]];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECT_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helper Methods

-(NSDictionary*)taskObjectAsPropertyList : (KJTasks*)taskObject
{
    NSDictionary *dictionary = @{TASK_TITLE : taskObject.title, TASK_DESCRIPTION : taskObject.description, TASK_DATE : taskObject.date, TASK_COMPLEETION : @(taskObject.isCompleted)};
    return dictionary;
}

-(KJTasks *)taskObjectForDictionary: (NSDictionary*)dictionary
{
    KJTasks *taskObject = [[KJTasks alloc] initWithData:dictionary];
    return taskObject;
}

-(BOOL)isDateGreaterThanDate: (NSDate*)date and:(NSDate*)toDate
{
    NSTimeInterval dateInterval = [date timeIntervalSince1970];
    NSTimeInterval toDateInterval = [toDate timeIntervalSince1970];
    
    if (dateInterval > toDateInterval)
    
    return YES;
    else return NO;
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjects count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //configure cell
    
    KJTasks *task = self.taskObjects[indexPath.row];
    cell.textLabel.text = task.title;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:task.date];
    cell.detailTextLabel. text = stringFromDate;
    
    BOOL isOverDue = [self isDateGreaterThanDate:[NSDate date] and:task.date];
    if (isOverDue == YES) cell.backgroundColor = [UIColor redColor];
    else cell.backgroundColor = [UIColor darkGrayColor];
    
    return cell;
}





@end
