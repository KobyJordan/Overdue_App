//
//  KJEditTaskViewController.h
//  Overdure
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KJEditTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;



@end
