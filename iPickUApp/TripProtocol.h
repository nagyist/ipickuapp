//
//  TripProtocol.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/21/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#ifndef iPickUApp_TripProtocol_h
#define iPickUApp_TripProtocol_h

@protocol TripProtocol <NSObject>

- (void)terminateTrip:(BOOL)tripCompleted;

@end

#endif
