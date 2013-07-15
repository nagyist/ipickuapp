//
//  Driver.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/15/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "Passenger.h"

#define DRIVER_STATUS_NEW @"NEW"
#define DRIVER_STATUS_OVER @"OVER"

@interface Driver : Passenger

@property (strong, atomic) NSString *status; // NEW - ONGOING - OVER
@property (strong, atomic) NSNumber *seats;

+ (NSString *)parseClassName;


@end
