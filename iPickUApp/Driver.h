//
//  Driver.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/15/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "Passenger.h"

@interface Driver : Passenger

@property (strong, atomic) NSNumber *seats;

+ (NSString *)parseClassName;

@end
