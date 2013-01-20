//
//  ViewController.h
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *it, *is, *am, *pm, *a, *quarter, *twenty, *five1, *half, *ten1, *to, *past, *nine, *one, *six, *three, *four, *five2, *two, *eight, *eleven, *seven, *twelve, *ten2, *oclock; //Labels that can be lit up
    int themeCount;     //Used to get the current theme
    IBOutletCollection(UILabel) UILabel *AllLabels; //references all of the labels connected
    
}

-(IBAction)changeTheme; //Cycle through themes
-(void)amPM:(int)hour;              //Turn on either AM or PM, based on current hour
-(void)pastTo:(int)minute;          //Turn on "past" or "to" light, based on current minute
-(void)theme1;                      //Set up themes
-(void)theme2;
-(void)theme3;
-(void)theme4;

@end