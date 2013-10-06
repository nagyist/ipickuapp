//
//  City.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 9/22/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <Parse/Parse.h>

@interface City : PFObject<PFSubclassing>

@property (strong, atomic) NSString *name;

@end
