//
//  ViewController.h
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *it, *is, *am, *pm, *a, *quarter, *twenty, *five1, *half, *ten1, *to, *past, *nine, *one, *six, *three, *four, *five2, *two, *eight, *eleven, *seven, *twelve, *ten2, *oclock;
    int themeCount;
    UIColor *onColor;
    UIColor *offColor;
}
-(IBAction)changeTheme;

-(void)turnOn:(UILabel *)label;
-(void)turnOff:(UILabel *)label;
-(void)turnOffAll;
-(void)amPM:(int)hour;
-(void)pastTo:(int)minute;
-(void)theme1;
-(void)theme2;
-(void)theme3;
-(void)theme4;

@end