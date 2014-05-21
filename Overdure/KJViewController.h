//
//  KJViewController.h
//  Overdure
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "KJAddTaskViewController.h"

@interface KJViewController : UIViewController <KJAddTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *taskObjects;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)reorderBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
