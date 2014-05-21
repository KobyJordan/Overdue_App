//
//  KJTasks.h
//  Overdue
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KJTasks : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) BOOL isCompleted;

-(id)initWithData:(NSDictionary*)data;


@end
