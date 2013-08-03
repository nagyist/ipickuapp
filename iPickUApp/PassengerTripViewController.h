//
//  PassengerTripViewController.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Driver.h"
#import "TripProtocol.h"

@interface PassengerTripViewController : UIViewController<TripProtocol>

@property (weak, nonatomic) Passenger *passenger;


@end
