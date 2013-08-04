//
//  DriverTripViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/19/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "DriverTripViewController.h"

#import <Parse/Parse.h>

@interface DriverTripViewController ()
@property (weak, nonatomic) IBOutlet UILabel *passengerCountLabel;

@end

@implementation DriverTripViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchPassengers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchPassengers {
    // Loading passenger heading to the same location couple
    
    NSDateComponents *offset = [[NSDateComponents alloc] init];
    [offset setHour:-1];
    NSCalendar *gregorian = [[NSCalendar alloc] init];
    NSDate *date = [gregorian dateByAddingComponents:offset toDate:[NSDate date] options:0];
    
    PFQuery * query = [PFQuery queryWithClassName:@"Passenger"];
    [query whereKey:@"available" equalTo:[NSNumber numberWithBool:true]];
    [query whereKey:@"source" equalTo:self.driver.source];
    [query whereKey:@"destination" equalTo:self.driver.destination];
    [query whereKey:@"createdAt" greaterThanOrEqualTo:date];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [self.passengerCountLabel setText:[NSString stringWithFormat:@"%d", [objects count]]];
        }
    }];
}

- (void)terminateTrip:(BOOL)tripCompleted {
    [self.driver setAvailable:NO];
    [self.driver setIsTripOver:tripCompleted];
    [self.driver saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

- (IBAction)onDecreaseSeatsClick:(id)sender {
    NSNumber *seats = self.driver.seats;
    [self.driver setSeats:[NSNumber numberWithInt:[seats intValue] - 1]];
    [self.driver saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // Give feedback to users
        }
    }];
}

- (IBAction)onDeleteClick:(id)sender {
    [self terminateTrip:NO];
}

@end
