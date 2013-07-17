//
//  Customer.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/14/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "Passenger.h"

#import <Parse/PFObject+Subclass.h>

@implementation Passenger

@dynamic source;
@dynamic destination;
@dynamic available;

+ (NSString *)parseClassName {
    return @"Passenger";
}

@end
