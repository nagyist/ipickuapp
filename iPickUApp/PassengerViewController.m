//
//  PassengerViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "PassengerViewController.h"
#import "LocationViewController.h"
#import "PassengerTripViewController.h"

@interface PassengerViewController ()

@end

@implementation PassengerViewController

@synthesize isPickUp;

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self validateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)clear {
    self.pickUpLocation = nil;
    self.dropOffLocation = nil;
    [self.pickUpLocationLabel setText:@"Pick up location"];
    [self.dropOffLocationLabel setText:@"Drop off location"];
    [self.selectDropOffLocationButton setEnabled:NO];
    [self.submitButton setEnabled:NO];
}


- (void)setPickUpLocation:(Location *)location {
    _pickUpLocation = location;
    [self.pickUpLocationLabel setText:location.station];
    [self.selectDropOffLocationButton setEnabled:YES];
    
}

- (void)setDropOffLocation:(Location *)location {
    _dropOffLocation = location;
    [self.dropOffLocationLabel setText:location.station];
    [self validateUI];
}

- (void)validateUI {
    if ([self isReadyToSubmit]) {
        [self.submitButton setEnabled:YES];
    } else {
        [self.submitButton setEnabled:NO];
    }
}

- (BOOL)isReadyToSubmit {
    
    if (!self.pickUpLocation) {
        // we can provide feedback to the user
        return NO;
    }
    
    if (!self.dropOffLocation) {
        // we can provide feedback to the user
        return NO;
    }
    
    if ([self.dropOffLocation.objectId isEqualToString:self.pickUpLocation.objectId]) {
        return NO;
    }
    
    return YES;    
}

- (void)submit {
    self.passenger = [Passenger object];
    [self.passenger setSource:[self.pickUpLocationLabel text]];
    [self.passenger setDestination:[self.dropOffLocationLabel text]];
    [self.passenger setAvailable:YES];
    [self.passenger saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self performSegueWithIdentifier:SUBMIT_REQUEST_SEGUE sender:self];
        }
    }];
    
}

- (void)setSegueDestinationInfo:(UIViewController *)destination {
    PassengerTripViewController *tripViewController = (PassengerTripViewController *)destination;
    [tripViewController setPassenger:self.passenger];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueIdentifier = [segue identifier];
    if ([segueIdentifier isEqualToString:PICKUP_LOCATION_SEGUE]) {
        self.isPickUp = YES;
        LocationViewController *destination = [segue destinationViewController];
        [destination setDelegate:self];
        destination.isOrigin = YES;
    } else if ([segueIdentifier isEqualToString:DROPOFF_LOCATION_SEGUE]) {
        self.isPickUp = NO;
        LocationViewController *destination = [segue destinationViewController];
        [destination setDelegate:self];
        destination.isOrigin = NO;
    } else if ([segueIdentifier isEqualToString:SUBMIT_REQUEST_SEGUE]) {
        [self setSegueDestinationInfo:segue.destinationViewController];
    }
}

- (IBAction)onClearClick:(id)sender {
    [self clear];
}

- (IBAction)onSUbmitClick:(id)sender {
    [self submit];
}



@end
