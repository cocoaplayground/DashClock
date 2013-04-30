//
//  ThemeManager.h
//  DashClock
//
//  Created by Chase Acton on 4/29/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface ThemeManager : NSObject


-(void)changeTheme;

@property (nonatomic) int themeCount;
@property (nonatomic, retain) UIColor *onColor;
@property (nonatomic, retain) UIColor *offColor;
@property (nonatomic, retain) UIColor *backgroundColor;

@end