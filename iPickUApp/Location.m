//
//  Location.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 9/23/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "Location.h"
#import <Parse/PFObject+Subclass.h>

@implementation Location

@dynamic city;
@dynamic cityObject;
@dynamic station;
@dynamic isDestination;
@dynamic isOrigin;

+ (NSString *)parseClassName {
    return @"Location";
}

@end
