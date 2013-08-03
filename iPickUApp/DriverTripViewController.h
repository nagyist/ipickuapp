//
//  DriverTripViewController.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/19/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Driver.h"
#import "TripProtocol.h"

@interface DriverTripViewController : UIViewController<TripProtocol>

@property (weak, nonatomic) Driver *driver;

@end
