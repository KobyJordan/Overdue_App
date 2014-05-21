//
//  KJAddTaskViewController.h
//  Overdure
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "KJTasks.h"

@protocol KJAddTaskViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAskTask:(KJTasks*)task;

@end

@interface KJAddTaskViewController : UIViewController

@property (weak, nonatomic) id <KJAddTaskViewControllerDelegate>delegate;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)addTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;


@end
