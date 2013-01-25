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
    struct DComps currentTime = [delegate getDateComponets];
    [self setupClock:currentTime.min]; //Setup dots, set initial colors and theme
    [self clock]; //Do initial update
    [self performSelector:@selector(startClock) withObject:nil afterDelay:(60 - currentTime.sec)]; //Update clock once per minute, starting on the minute
}

#pragma mark - Clock Setup -

-(void)setupClock:(int)minute{
    [self initializeDots:minute];    
    onColor = [UIColor whiteColor];
    offColor = [UIColor darkGrayColor];
    themeCount = 1;
}

-(void)startClock{
    [self clock];
    [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(clock) userInfo:nil repeats:YES]; //Update clock every second
}

#pragma mark - Main Clock Methods -

-(void)clock{
    for (UIView *view in self.view.subviews){       //Turn off all labels
        if([view isKindOfClass:[UILabel class]]){
            UILabel *label = (UILabel*)view;
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
            label.off;
            [UIView commitAnimations];
        }
    }
    it.on; //Always on
    is.on; //Always on
    
    [self dots]; //Setup minute dots

    struct DComps currentTime = [delegate getDateComponets];
    
    NSString *hourString = nil; //Current hour
    if (currentTime.hour > 12){
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour-12];
    }else{
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    }
    
    NSString *nextHourString = nil; //Next hour
    if (currentTime.hour + 1 > 12){
        nextHourString = [NSString stringWithFormat:@"%i",currentTime.hour+1-12];
    }else{
        nextHourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    }
    
    //Light up 10
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
            UILabel *label = (UILabel*)view;
            if (label.enabled == TRUE){
                [UIView beginAnimations: nil context: NULL];
                [UIView setAnimationDuration:0.5];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
                label.textColor = onColor;
                label.alpha = 1.0;
                [UIView commitAnimations];

            }
            else{
                [UIView setAnimationDuration:0.5];
                [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
                label.textColor = onColor;
                label.textColor = offColor;
                label.alpha = 0.3;
                [UIView commitAnimations];
            }
        }
    }
}

-(void)amPM:(int)hour{
    if (hour > 12){
        pm.on;
    }else{
        am.on;
    }
}

-(void)pastTo:(int)minute{
    if (minute == 0){
        to.off;
        past.off;
    }else if (minute >= 35){
        to.on;
    }else if (minute >= 5){
        past.on;
    }
}

#pragma mark - Minute Dots -

-(void)initializeDots:(int)minute{
    NSArray *firstDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:6], [NSNumber numberWithInteger:11],[NSNumber numberWithInteger:16],[NSNumber numberWithInteger:21],[NSNumber numberWithInteger:26],[NSNumber numberWithInteger:31],[NSNumber numberWithInteger:36],[NSNumber numberWithInteger:41],[NSNumber numberWithInteger:46],[NSNumber numberWithInteger:51],[NSNumber numberWithInteger:56],nil];
    
    NSArray *secondDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:2],[NSNumber numberWithInteger:7], [NSNumber numberWithInteger:12],[NSNumber numberWithInteger:17],[NSNumber numberWithInteger:22],[NSNumber numberWithInteger:27],[NSNumber numberWithInteger:32],[NSNumber numberWithInteger:37],[NSNumber numberWithInteger:42],[NSNumber numberWithInteger:47],[NSNumber numberWithInteger:52],[NSNumber numberWithInteger:57],nil];
    
    NSArray *thirdDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:3],[NSNumber numberWithInteger:8], [NSNumber numberWithInteger:13],[NSNumber numberWithInteger:18],[NSNumber numberWithInteger:23],[NSNumber numberWithInteger:28],[NSNumber numberWithInteger:33],[NSNumber numberWithInteger:38],[NSNumber numberWithInteger:43],[NSNumber numberWithInteger:48],[NSNumber numberWithInteger:53],[NSNumber numberWithInteger:58],nil];
    
    NSArray *fourthDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:4],[NSNumber numberWithInteger:9], [NSNumber numberWithInteger:14],[NSNumber numberWithInteger:19],[NSNumber numberWithInteger:24],[NSNumber numberWithInteger:29],[NSNumber numberWithInteger:34],[NSNumber numberWithInteger:39],[NSNumber numberWithInteger:44],[NSNumber numberWithInteger:49],[NSNumber numberWithInteger:54],[NSNumber numberWithInteger:59],nil];
    
    dotCount = 0;
    
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute]]){
        dotCount = 1;
    }
    if ([secondDots containsObject:[NSNumber numberWithInteger:minute]]){
        dotCount = 2;
    }
    if ([thirdDots containsObject:[NSNumber numberWithInteger:minute]]){
        dotCount = 3;
    }
    if ([fourthDots containsObject:[NSNumber numberWithInteger:minute]]){
        dotCount = 4;
    }
}

-(void)dots{
    switch (dotCount) {
        case 0:
            dot1.off;
            dot2.off;
            dot3.off;
            dot4.off;
            break;
        case 1:
            dot1.on;
            break;
        case 2:
            dot1.on;
            dot2.on;
            break;
        case 3:
            dot1.on;
            dot2.on;
            dot3.on;
            break;
        case 4:
            dot1.on;
            dot2.on;
            dot3.on;
            dot4.on;
            dotCount = 0;
            break;
        default:
            break;
    }
    dotCount++;
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
    onColor = [UIColor blackColor];
    offColor = [UIColor darkGrayColor];
}

-(void)theme3{
    self.view.backgroundColor = [UIColor blackColor];
    onColor = [UIColor colorWithRed:19/255 green:92/255 blue:242/255 alpha:1];
    offColor = [UIColor darkGrayColor];
}

-(void)theme4{
    self.view.backgroundColor = [UIColor whiteColor];
    onColor = [UIColor colorWithRed:19/255 green:92/255 blue:242/255 alpha:1];
    offColor = [UIColor darkGrayColor];
}

#pragma mark - Memory Management -

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end