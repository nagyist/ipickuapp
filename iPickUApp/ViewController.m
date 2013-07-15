//
//  ViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/14/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "ViewController.h"

// Parse Framework
#import <Parse/Parse.h>


#import "Passenger.h"
#import "Driver.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    Driver *customer = [Driver object];
    customer.source = @"source";
    customer.destination = @"destination";
    customer.seats = [NSNumber numberWithInt:4];
    customer.status = DRIVER_STATUS_NEW;
    [customer saveInBackground];
    
    [super viewDidLoad];	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
