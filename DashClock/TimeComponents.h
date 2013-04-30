//
//  TimeComponents.h
//  DashClock
//
//  Created by Chase Acton on 4/29/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeComponents : NSObject

@property (nonatomic, retain) NSMutableDictionary *hours; //Dictionary to convert hours as an integer to it's string value (Ex. "1" = "One")

-(struct DComps)getDateComponets; //Returns current date and time information

@end
