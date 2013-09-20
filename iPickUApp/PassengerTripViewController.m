//
//  PassengerTripViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "PassengerTripViewController.h"

#import <Parse/Parse.h>

@interface PassengerTripViewController ()

@property (weak, nonatomic) IBOutlet UILabel *carCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatCountLabel;

@end

@implementation PassengerTripViewController

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
    self.navigationItem.hidesBackButton = YES;
    [self fetchDrivers];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchDrivers {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [NSDateComponents new];
    comps.minute = -30;
    NSDate *date = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    
    PFQuery * query = [PFQuery queryWithClassName:@"Driver"];
    [query whereKey:@"available" equalTo:[NSNumber numberWithBool:true]];
    [query whereKey:@"source" equalTo:self.passenger.source];
    [query whereKey:@"destination" equalTo:self.passenger.destination];
    [query whereKey:@"updatedAt" greaterThanOrEqualTo:date];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [self.carCountLabel setText:[NSString stringWithFormat:@"%d", [objects count]]];
            NSInteger seats = 0;
            for (Driver *driver in objects) {
                seats += [driver.seats integerValue];
            }
            [self.seatCountLabel setText:[NSString stringWithFormat:@"%d", seats]];
        }
    }];
}

- (void)terminateTrip:(BOOL)tripCompleted {
    [self.passenger setAvailable:NO];
    [self.passenger setIsTripOver:tripCompleted];
    [self.passenger saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

- (IBAction)onPickUpClick:(id)sender {
    [self terminateTrip:YES];
}


- (IBAction)onDeleteClick:(id)sender {
    [self terminateTrip:NO];
}


- (IBAction)onRefreshClick:(id)sender {
    [self fetchDrivers];
}


@end
