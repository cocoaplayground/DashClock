//
//  AppDelegate.m
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize hours;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [UIApplication sharedApplication].idleTimerDisabled = YES; //Prevent device from going to sleep
    
    hours = [[NSMutableDictionary alloc] init]; //Dictionary to hold key-value pairs for hours
    [hours setObject: @"one" forKey: @"1"];
    [hours setObject: @"two" forKey: @"2"];
    [hours setObject: @"three" forKey: @"3"];
    [hours setObject: @"four" forKey: @"4"];
    [hours setObject: @"five2" forKey: @"5"];
    [hours setObject: @"six" forKey: @"6"];
    [hours setObject: @"seven" forKey: @"7"];
    [hours setObject: @"eight" forKey: @"8"];
    [hours setObject: @"nine" forKey: @"9"];
    [hours setObject: @"ten2" forKey: @"10"];
    [hours setObject: @"eleven" forKey: @"11"];
    [hours setObject: @"twelve" forKey: @"12"];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [UIApplication sharedApplication].idleTimerDisabled = NO; //Let device go to sleep
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [UIApplication sharedApplication].idleTimerDisabled = NO; //Let device go to sleep
}

-(struct DComps)getDateComponets{
    struct DComps a;
    NSDate *now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [gregorian components:(NSYearCalendarUnit  | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:now];

    //Get the components we need for the clock
    a.min   = [dateComponents minute];
    a.hour  = [dateComponents hour];
    a.sec   = [dateComponents second];
    
    //Not currently used, but may be useful in the future
    a.year  = [dateComponents year];
    a.month = [dateComponents month];
    a.day   = [dateComponents day];
    return a;
}

@end