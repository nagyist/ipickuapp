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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)clear {
    [self.pickUpLocationLabel setText:@"Pick up location"];
    [self.dropOffLocationLabel setText:@"Drop off location"];
    [self.selectDropOffLocationButton setEnabled:NO];
    [self.submitButton setEnabled:NO];
}

- (void)setLocation:(NSString *)location {
    if (self.isPickUp) {
        [self.pickUpLocationLabel setText:location];
        [self.selectDropOffLocationButton setEnabled:YES];
    } else {
        [self.dropOffLocationLabel setText:location];
        if ([self isReadyToSubmit]) {
            [self.submitButton setEnabled:YES];
        }
    }

}

- (BOOL)isReadyToSubmit {
    NSString *pickUp = [self.pickUpLocationLabel text];
    NSString *dropOff = [self.dropOffLocationLabel text];
    
    if ([pickUp isEqualToString:PICK_UP_LOCATION] || [pickUp isEqualToString:@""]) {
        // we can provide feedback to the user
        return NO;
    }
    
    if ([dropOff isEqualToString:PICK_UP_LOCATION] || [dropOff isEqualToString:@""]) {
        // we can provide feedback to the user
        return NO;
    }
    
    return YES;    
}

- (BOOL)submit {
    self.passenger = [Passenger object];
    [self.passenger setSource:[self.pickUpLocationLabel text]];
    [self.passenger setDestination:[self.dropOffLocationLabel text]];
    [self.passenger setAvailable:YES];
    return [self.passenger save];
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:SUBMIT_REQUEST_SEGUE]) {
        if ([self submit]) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
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
    } else if ([segueIdentifier isEqualToString:DROPOFF_LOCATION_SEGUE]) {
        self.isPickUp = NO;
        LocationViewController *destination = [segue destinationViewController];
        [destination setDelegate:self];
    } else if ([segueIdentifier isEqualToString:SUBMIT_REQUEST_SEGUE]) {
        [self setSegueDestinationInfo:segue.destinationViewController];
    }
}

- (IBAction)onClearClick:(id)sender {
    [self clear];
}




@end
