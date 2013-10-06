//
//  City.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 9/22/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "City.h"
#import <Parse/PFObject+Subclass.h>

@implementation City

@dynamic name;

+ (NSString *)parseClassName {
    return @"City";
}

@end
