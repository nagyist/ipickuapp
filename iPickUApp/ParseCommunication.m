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
#import "City.h"

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
            [self fetchLocations];
        }
    }];
}

- (void)fetchLocations
{
    self.origins = [NSMutableDictionary dictionary];
    self.destinations = [NSMutableDictionary dictionary];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    [query includeKey:@"city"];
//    query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Origins FETCHED %d", [objects count]);
            for (Location *location in objects) {
                NSMutableArray *currentStations;
                if ([location.isOrigin boolValue]) {
                    currentStations = [self.origins objectForKey:location.city.name];
                    if (!currentStations) {
                        currentStations = [NSMutableArray array];
                    }
                    [currentStations addObject:location];
                    [self.origins setObject:currentStations forKey:location.city.name];
                    NSLog(@"Origin CITY %@ has a total of %d", location.city.name, [currentStations count]);
                }
                if ([location.isDestination boolValue]) {
                    currentStations = [self.destinations objectForKey:location.city.name];
                    if (!currentStations) {
                        currentStations = [NSMutableArray array];
                    }
                    [currentStations addObject:location];
                    [self.destinations setObject:currentStations forKey:location.city.name];
                    NSLog(@"Destination CITY %@ has a total of %d", location.city.name, [currentStations count]);
                }
            }
            NSLog(@"STOP");
        }
    }];
}





@end
