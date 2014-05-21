//
//  KJTasks.m
//  Overdue
//
//  Created by Koby Jordan on 21/05/2014.
//  Copyright (c) 2014 Koby Jordan. All rights reserved.
//

#import "KJTasks.h"

@implementation KJTasks

-(id)initWithData:(NSDictionary*)data;
{
    self = [super init];
    
    if (self)
    {
        self.title = data[TASK_TITLE];
        self.description = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.isCompleted = [data[TASK_COMPLEETION] boolValue];
    }
    return self;
}

-(id)init
{
    self = [self initWithData:nil];

    return self;
}

@end
