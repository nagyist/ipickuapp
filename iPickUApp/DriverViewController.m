//
//  DriverViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "DriverViewController.h"

@interface DriverViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *seatPicker;

@end

@implementation DriverViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)clear {
    [super clear];
    [self.seatPicker setSelectedSegmentIndex:0];
}

- (void)submit {
    self.passenger = [Driver object];
    [self.passenger setSource:[self.pickUpLocationLabel text]];
    [self.passenger setDestination:[self.dropOffLocationLabel text]];
    [self.passenger setAvailable:YES];
    [self.passenger setObject:[NSNumber numberWithInteger:[self.seatPicker selectedSegmentIndex] + 1] forKey:@"seats"];
    [self.passenger saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self performSegueWithIdentifier:SUBMIT_REQUEST_SEGUE sender:self];
        }
    }];
}

- (BOOL)isReadyToSubmit {
    return [super isReadyToSubmit] && [self.seatPicker isEnabled];
}

- (void)validateUI {
    if ([super isReadyToSubmit]) {
        [self.seatPicker setEnabled:YES];
    }
    if ([self isReadyToSubmit]) {
        [self.submitButton setEnabled:YES];
    }
}

- (void)setSegueDestinationInfo:(UIViewController *)destination {
//    PassengerTripViewController *tripViewController = (PassengerTripViewController *)destination;
//    [tripViewController setPassenger:self.passenger];
}

- (IBAction)onSeatPickerClick:(UISegmentedControl *)sender {
    [self validateUI];
}


@end
