//
//  Customer.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/14/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <Parse/Parse.h>

@interface Passenger : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSString *destination;
@property (nonatomic) BOOL available;

+ (NSString *)parseClassName;

@end
