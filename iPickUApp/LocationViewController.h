//
//  LocationViewController.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 7/16/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationProtocol.h"

#define SETUP_SEGUE @"SETUP_SEGUE"


@interface LocationViewController : UITableViewController

@property (weak, nonatomic) id<LocationProtocol> delegate;

@end
