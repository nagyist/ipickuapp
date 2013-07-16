//
//  PassengerViewController.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LocationProtocol.h"

#import "Driver.h"


#define PICK_UP_LOCATION @"Pick up location"
#define DROP_OFF_LOCATION @"Drop off location"
#define SUBMIT_REQUEST_SEGUE @"SUBMIT_REQUEST"

@interface PassengerViewController : UIViewController<LocationProtocol>

@property (weak, nonatomic) IBOutlet UILabel *pickUpLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dropOffLocationLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectDropOffLocationButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@property (nonatomic) BOOL isPickUp;

- (void)clear;
- (BOOL)submit;
- (BOOL)isReadyToSubmit;

@end
