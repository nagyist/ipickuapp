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
            NSLog(@"CITIES FETCHED %d", [self.cities count]);
            [self fetchLocations];
        } else {
            NSLog(@"ERROR LOADING CITIES");
        }        
    }];
}

- (void)fetchLocations
{
    self.origins = [NSMutableDictionary dictionary];
    self.destinations = [NSMutableDictionary dictionary];
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Origins FETCHED %d", [objects count]);
            for (Location *location in objects) {                
                
                NSMutableArray *currentStations;
                if ([location.isOrigin boolValue]) {
                    currentStations = [self.origins objectForKey:location.city];
                    if (!currentStations) {
                        currentStations = [NSMutableArray array];
                    }
                    [self.origins setObject:currentStations forKey:location.city];
                    [currentStations addObject:location];
                    NSLog(@"Origin CITY %@ has a total of %d", location.city, [currentStations count]);
                }
                if ([location.isDestination boolValue]) {
                    currentStations = [self.destinations objectForKey:location.city];
                    if (!currentStations) {
                        currentStations = [NSMutableArray array];
                    }
                    [self.destinations setObject:currentStations forKey:location.city];
                    [currentStations addObject:location];
                    NSLog(@"Destination CITY %@ has a total of %d", location.city, [currentStations count]);
                }
                
//                attach object to the city
                City *city;
                for (City *current_city in self.cities) {
                    if ([current_city.name isEqualToString:location.city]) {
                        city = current_city;
                        break;
                    }
                }
                
                
                if (city) {
                    location.cityObject = city;
                    [location saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if (succeeded) {
                            NSLog(@"SAVED");
                        }
                    }];
                }
                
            }
        }
    }];
}



@end
