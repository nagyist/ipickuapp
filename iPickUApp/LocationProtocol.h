//
//  LocationProtocol.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#ifndef iPickUApp_LocationProtocol_h
#define iPickUApp_LocationProtocol_h

#define PICKUP_LOCATION_SEGUE @"PICK_UP_LOCATION"
#define DROPOFF_LOCATION_SEGUE @"DROP_OFF_LOCATION"

@class Location;

@protocol LocationProtocol <NSObject>

@required

@property (weak, nonatomic) Location *pickUpLocation;
@property (weak, nonatomic) Location *dropOffLocation;

@end


#endif
