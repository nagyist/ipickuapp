//
//  PassengerTripViewController.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Passenger.h"

@interface PassengerTripViewController : UIViewController

@property (nonatomic) NSInteger cars;
@property (nonatomic) NSInteger seats;
@property (weak, nonatomic) Passenger *passenger;


@end
