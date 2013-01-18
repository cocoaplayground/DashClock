//
//  AppDelegate.h
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableDictionary *hours; //Dictionary to convert hours as an integer to it's string value (Ex. "1" = "One")
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableDictionary *hours;

-(struct DComps)getDateComponets; //Returns current date and time information

@end