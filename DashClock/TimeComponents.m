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

@end