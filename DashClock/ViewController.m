//
//  ViewController.m
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "ViewController.h"
#import "Settings.h"

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self clock];
    themeCount = 1;
    onColor = [UIColor whiteColor];
    offColor = [UIColor darkGrayColor];
    //TODO turn off auto-lock when app is launched. Turn on when app closes
    //Add fade animation for on  and off
    //Random light up and flash on launch then fade to current time    
    //Different themes
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clock) userInfo:nil repeats:YES];
}

-(void)clock{
    [self turnOffAll];
    [self turnOn:it]; //Always on
    [self turnOn:is]; //Always on
    struct DComps currentTime = [delegate getDateComponets];
    NSString *hourString = nil;
    
    if (currentTime.hour > 12){
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour-12];
    }
    else{
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    }
    
    //Light up 10
    //XX:10 - XX:14 and XX:50-XX:54
    if (((currentTime.min >= 10) && (currentTime.min < 15)) || ((currentTime.min > 49) && (currentTime.min < 55))){
        [self turnOn:ten1];
    }
    
    //Light up 5
    if (((currentTime.min >= 5) && (currentTime.min < 10)) || ((currentTime.min > 54) && (currentTime.min < 60))){
        [self turnOn:five1];
    }
    
    //Light up a quarter
    if (((currentTime.min >= 15) && (currentTime.min < 20)) || ((currentTime.min > 44) && (currentTime.min < 50))){
        [self turnOn:a];
        [self turnOn:quarter];
    }
    
    //Light up a half
    if (((currentTime.min >= 30) && (currentTime.min < 35))){
        [self turnOn:half];
    }
    
    //Light up twenty
    if (((currentTime.min >= 20) && (currentTime.min < 30)) || ((currentTime.min >= 40) && (currentTime.min < 45))){
        [self turnOn:twenty];
    }
    
    //Light up twenty five
    if (((currentTime.min >= 25) && (currentTime.min < 30)) || ((currentTime.min >= 35) && (currentTime.min < 40))){
        [self turnOn:twenty];
        [self turnOn:five1];
    }
    
    //Hour
    if (currentTime.min < 35){
        //light up current hour
        [self turnOn:[self valueForKey:[delegate.hours valueForKey:hourString]]];
    }
    else{
        //light up next hour
        hourString = [NSString stringWithFormat:@"%i",[hourString intValue]+1];
        [self turnOn:[self valueForKey:[delegate.hours valueForKey:hourString]]];
    }
    
    //On the hour
    if ((currentTime.min >= 0) && (currentTime.min < 5)){
        [self turnOn:oclock];
        [self turnOn:[self valueForKey:[delegate.hours valueForKey:hourString]]];
    }
    
    //[self amPM:currentTime.hour];
    [self pastTo:currentTime.min];
}

-(void)amPM:(int)hour{
    if (hour > 12){
        [self turnOn:pm];
    }
    else{
        [self turnOn:am];
    }
}

-(void)pastTo:(int)minute{
    if (minute == 0){
        
    }
    else if (minute >= 35){
        [self turnOn:to];
    }
    else if (minute >= 5){
        [self turnOn:past];
    }
}

#pragma mark - Switches -

-(void)turnOn:(UILabel *)label{
    /*[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];*/
    label.textColor = onColor;
    label.alpha = 1; //Alpha of 1 is on
    //[UIView commitAnimations];
}

-(void)turnOff:(UILabel *)label{
    /*[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];*/
    label.textColor = offColor;
    label.alpha = 0.3; //Alpha of 0.3 is considered off
    //[UIView commitAnimations];
}

-(void)turnOffAll{
    [self turnOff:a];
    [self turnOff:quarter];
    [self turnOff:twenty];
    [self turnOff:five1];
    [self turnOff:half];
    [self turnOff:ten1];
    [self turnOff:to];
    [self turnOff:past];
    [self turnOff:nine];
    [self turnOff:one];
    [self turnOff:six];
    [self turnOff:three];
    [self turnOff:four];
    [self turnOff:five2];
    [self turnOff:two];
    [self turnOff:eight];
    [self turnOff:eleven];
    [self turnOff:seven];
    [self turnOff:twelve];
    [self turnOff:ten2];
    [self turnOff:oclock];
}

#pragma mark - Themes -

-(IBAction)changeTheme{
    themeCount++;
    if (themeCount > 4){
        themeCount = 1;
    }
    
    NSString *themeName = [NSString stringWithFormat:@"theme%i",themeCount];
 
    SEL s = NSSelectorFromString(themeName);
    [self performSelector:s];
    [self clock]; //Called to eliminate 1 second delay when turning one clock
}

-(void)theme1{
    self.view.backgroundColor = [UIColor blackColor];
    onColor = [UIColor whiteColor];
    offColor = [UIColor darkGrayColor];
}

-(void)theme2{
    self.view.backgroundColor = [UIColor whiteColor];
    onColor = [UIColor blueColor];
    //onColor = [UIColor colorWithRed:30 green:144 blue:255 alpha:1.0f];
    offColor = [UIColor darkGrayColor];
}

-(void)theme3{
    self.view.backgroundColor = [UIColor blackColor];
    
}

-(void)theme4{
        self.view.backgroundColor = [UIColor whiteColor];
    onColor = [UIColor blackColor];
    offColor = [UIColor darkGrayColor];
}

#pragma mark - Memory Management -

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end