//
//  DriverTripViewController.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/19/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Driver.h"

@interface DriverTripViewController : UIViewController

@property (nonatomic) NSInteger passengers;

@property (weak, nonatomic) Driver *driver;

@end
