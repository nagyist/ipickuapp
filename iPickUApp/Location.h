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
@property (strong, nonatomic) PFObject *cityObject;
@property (strong, nonatomic) NSString *station;
@property (strong, nonatomic) NSNumber *isDestination;
@property (strong, nonatomic) NSNumber *isOrigin;

@end
