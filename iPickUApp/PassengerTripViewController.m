//
//  PassengerTripViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "PassengerTripViewController.h"

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
	[self.carCountLabel setText:[NSString stringWithFormat:@"%d",self.cars]];
    [self.seatCountLabel setText:[NSString stringWithFormat:@"%d",self.seats]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPickUpClick:(id)sender {
    [self.passenger setAvailable:NO];
    [self.passenger saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
    }];
}



@end
