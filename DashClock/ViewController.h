//
//  ViewController.h
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel    *it, *is, *am, *pm, *a, *quarter, *twenty, *five1, //Labels that can be lit up
                        *half, *ten1, *to, *past, *nine, *one, *six, *three,
                        *four, *five2, *two, *eight, *eleven, *seven, *twelve,
                        *ten2, *oclock;
    IBOutlet UILabel    *dot1, *dot2, *dot3, *dot4; //Dots to show minutes
    int themeCount;     //Used to get the current theme
    int dotCount;
    UIColor *onColor;   //Color when label is "On"
    UIColor *offColor;  //Color when label is "Off"
}

-(IBAction)changeTheme;     //Cycle through themes
-(void)amPM:(int)hour;      //Turn on either AM or PM, based on current hour
-(void)pastTo:(int)minute;  //Turn on "past" or "to" light, based on current minute
-(void)dots;    //Turns on dots to show minutes
-(void)theme1;              //Set up themes
-(void)theme2;
-(void)theme3;
-(void)theme4;
-(void)setupClock:(int)minute;
-(void)startClock;
-(void)initializeDots:(int)minute;

@end