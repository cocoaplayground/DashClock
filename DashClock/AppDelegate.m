//
//  AppDelegate.m
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "AppDelegate.h"
#import "Flurry.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption{
    [Flurry startSession:@"3HTRD89PV3JCRCXR77FD"];
    [UIApplication sharedApplication].idleTimerDisabled = YES; //Prevent device from going to sleep
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application{
    [UIApplication sharedApplication].idleTimerDisabled = NO; //Let device go to sleep
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
}

- (void)applicationWillTerminate:(UIApplication *)application{
    [UIApplication sharedApplication].idleTimerDisabled = NO; //Let device go to sleep
}

@end