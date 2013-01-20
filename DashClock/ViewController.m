//
//  ViewController.m
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "Settings.h"

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self clock];
    themeCount = 1;
    //TODO turn off auto-lock when app is launched. Turn on when app closes
    //Add fade animation for on  and off
    //Random light up and flash on launch then fade to current time
    //Different themes
    //Set clock to updaate every minute, on the minute
    onColor = [UIColor whiteColor];
    offColor = [UIColor darkGrayColor];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clock) userInfo:nil repeats:YES]; //Update clock every second
}

-(void)clock{
    [AllLabels setValue:[UIColor darkGrayColor] forKey:@"textColor"];
    it.on; //Always on
    is.on //Always on
    struct DComps currentTime = [delegate getDateComponets];
    NSString *hourString = nil;
    
    if (currentTime.hour > 12){
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour-12];
    }
    else{
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    }
    
    NSString *nextHourString = nil;
    
    if (currentTime.hour + 1 > 12){
        nextHourString = [NSString stringWithFormat:@"%i",currentTime.hour+1-12];
    }
    else{
        nextHourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    }
    //Light up 10
    //XX:10 - XX:14 or XX:50-XX:54
    if (((CTGreaterThan 9) && (CTLessThan 15)) || ((CTGreaterThan 49) && (CTLessThan 55))){
        ten1.on;
    }
    
    //Light up 5
    if (((CTGreaterThan 4) && (CTLessThan 10)) || ((CTGreaterThan 54) && (CTLessThan 60))){
        five1.on;
    }
    
    //Light up a quarter
    if (((CTGreaterThan 14) && (CTLessThan 20)) || ((CTGreaterThan 44) && (CTLessThan 50))){
        a.on;
        quarter.on;
    }
    
    //Light up a half
    if (((CTGreaterThan 29) && (CTLessThan 35))){
        half.on
    }
    
    //Light up twenty
    if (((CTGreaterThan 19) && (CTLessThan 30)) || ((CTGreaterThan 39) && (CTLessThan 45))){
        twenty.on;
    }
    
    //Light up twenty five
    if (((CTGreaterThan 24) && (CTLessThan 30)) || ((CTGreaterThan 34) && (CTLessThan 40))){
        twenty.on;
        five1.on;
    }
    
    //Hour
    if (currentTime.min < 35){
        //light up current hour
        ((UILabel *)[self valueForKey:[delegate.hours valueForKey:hourString]]).on;
    }
    else{
        //light up next hour
        ((UILabel *)[self valueForKey:[delegate.hours valueForKey:nextHourString]]).on;
    }
    
    //On the hour
    if ((currentTime.min >= 0) && (currentTime.min < 5)){
        oclock.on;
        ((UILabel *)[self valueForKey:[delegate.hours valueForKey:hourString]]).on;
    }
    
    //[self amPM:currentTime.hour];
    [self pastTo:currentTime.min];
    
    //Check status of labels in view to determine if they should be on or off
    for (UIView *view in self.view.subviews){
        if([view isKindOfClass:[UILabel class]]){
            UILabel *lbl = (UILabel*)view;
            if (lbl.enabled == TRUE){
                lbl.textColor = onColor;
                lbl.alpha = 1.0;
            }
            else{
                lbl.textColor = offColor;
                lbl.alpha = 0.3;
            }
        }
    }
}

-(void)amPM:(int)hour{
    if (hour > 12){
        pm.on;
    }
    else{
        am.on;
    }
}

-(void)pastTo:(int)minute{
    if (minute == 0){
        
    }
    else if (minute >= 35){
        to.on;
    }
    else if (minute >= 5){
        past.on;
    }
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
    [self clock]; //Called to eliminate 1 second delay when turning on clock
}

-(void)theme1{
    self.view.backgroundColor = [UIColor blackColor];
    onColor = [UIColor whiteColor];
    offColor = [UIColor darkGrayColor];
}

-(void)theme2{
    self.view.backgroundColor = [UIColor whiteColor];
    onColor = [UIColor blueColor];
    offColor = [UIColor darkGrayColor];
}

-(void)theme3{
    self.view.backgroundColor = [UIColor blackColor];
    onColor = [UIColor purpleColor];
    offColor = [UIColor darkGrayColor];
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