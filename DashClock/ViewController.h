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
    int dotCount;       //Current minute dot
    int offAlpha;       //Alpha of "Off" labels
    UIColor *onColor;   //Color when label is "On"
    UIColor *offColor;  //Color when label is "Off"
}

-(IBAction)changeTheme; //Cycle through themes

@end