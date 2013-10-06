//
//  ParseCommunication.h
//  iPickUApp
//
//  Created by Giuseppe Macrì on 9/21/13.
//  Copyright (c) 2013 Giuseppe Macrì. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseCommunication : NSObject

@property (strong, nonatomic) NSArray *cities;
@property (strong, nonatomic) NSMutableDictionary *origins;

+ (id)parseCommunication;


@end
