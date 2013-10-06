//
//  ParseCommunication.m
//  iPickUApp
//
//  Created by Giuseppe Macrì on 9/21/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import "ParseCommunication.h"
#import <Parse/Parse.h>
#import "Location.h"

@implementation ParseCommunication

+ (id)parseCommunication
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self fetchCities];
        [self fetchOrigins];
    }
    
    return self;

}

- (void)fetchCities
{
    PFQuery *query = [PFQuery queryWithClassName:@"City"];
    query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.cities = objects;
            NSLog(@"CITIES FETCHED %d", [self.cities count]);
        } else {
            NSLog(@"ERROR LOADING CITIES");
        }        
    }];
}

- (void)fetchOrigins
{
    self.origins = [NSMutableDictionary dictionary];
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"ORIGINS FETCHED %d", [objects count]);
            for (Location *location in objects) {                
                NSMutableArray *currentStations = [self.origins objectForKey:location.city];
                if (!currentStations) {
                    currentStations = [NSMutableArray array];
                }
                [currentStations addObject:location];
                [self.origins setObject:currentStations forKey:location.city];
                NSLog(@"CITY %@ has a total of %d", location.city, [currentStations count]);
            }        
        }
    }];
}



@end
