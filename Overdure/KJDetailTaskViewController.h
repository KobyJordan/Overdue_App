//
//  KJDetailTaskViewController.h
//  Overdure
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KJDetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

- (IBAction)editBarButtonItemPressed:(UIBarButtonItem *)sender;




@end
