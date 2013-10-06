//
//  Location.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 9/23/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <Parse/Parse.h>

@interface Location : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *station;

@end
