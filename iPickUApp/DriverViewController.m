//
//  DriverViewController.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "DriverViewController.h"

@interface DriverViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pickUpLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dropOffLocationLabel;

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
    
}

- (BOOL)submit {
    return false;
}

- (BOOL)isReadyToSubmit {
    return false;
}


@end
