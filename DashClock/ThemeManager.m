//
//  ThemeManager.m
//  DashClock
//
//  Created by Chase Acton on 4/29/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "Settings.h"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks" //Added to surpress warning in changeTheme method while performing selector

@implementation ThemeManager
@synthesize onColor, offColor, themeCount;

- (id)init{
	self = [super init];
	if (self != nil)
        self.themeCount = 1;
	return self;
}

-(void)changeTheme{
    self.themeCount++;
    if (self.themeCount > 4) self.themeCount = 1;
    [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"theme%i",themeCount])];
}

-(void)theme1{
    self.backgroundColor = [UIColor blackColor];
    self.onColor = [UIColor whiteColor];
    self.offColor = [UIColor darkGrayColor];
}

-(void)theme2{
    self.backgroundColor = [UIColor whiteColor];
    self.onColor = [UIColor blackColor];
    self.offColor = [UIColor darkGrayColor];
}

-(void)theme3{
    self.backgroundColor = [UIColor blackColor];
    self.onColor = [UIColor colorWithRed:19.0/255.0 green:92.0/255.0 blue:242.0/255.0 alpha:1.0];
    self.offColor = [UIColor darkGrayColor];
}

-(void)theme4{
    self.backgroundColor = [UIColor whiteColor];
    self.onColor = [UIColor colorWithRed:19.0/255.0 green:92.0/255.0 blue:242.0/255.0 alpha:1.0];
}

@end