//
//  TimeComponents.m
//  DashClock
//
//  Created by Chase Acton on 4/29/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "Settings.h"

@implementation TimeComponents
@synthesize hours;

- (id)init{
	self = [super init];
	if (self != nil){
        hours = [[NSMutableDictionary alloc] init]; //Dictionary to hold key-value pairs for hours
        [self setupHoursDictionary];
    }
	return self;
}

-(void)setupHoursDictionary{
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

-(int)initializeMinuteDots:(int)minute{
    NSArray *firstDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:6], [NSNumber numberWithInteger:11],[NSNumber numberWithInteger:16],[NSNumber numberWithInteger:21],[NSNumber numberWithInteger:26],[NSNumber numberWithInteger:31],[NSNumber numberWithInteger:36],[NSNumber numberWithInteger:41],[NSNumber numberWithInteger:46],[NSNumber numberWithInteger:51],[NSNumber numberWithInteger:56],nil];
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute]])
        return 1;
    else if ([firstDots containsObject:[NSNumber numberWithInteger:minute-1]])
        return 2;
    else if ([firstDots containsObject:[NSNumber numberWithInteger:minute-2]])
        return 3;
    else if ([firstDots containsObject:[NSNumber numberWithInteger:minute-3]])
        return 4;
    else
        return 0;
}

@end