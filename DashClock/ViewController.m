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
    struct DComps currentTime = [delegate getDateComponets];
    
    [self getLabels:1];
    it.on; is.on; //Always on
    [self dots]; //Setup minute dots
    
    if (((CTGreaterThan 9) && (CTLessThan 15)) || ((CTGreaterThan 49) && (CTLessThan 55))){ //Light up 10
        ten1.on;
    }
    
    if (((CTGreaterThan 4) && (CTLessThan 10)) || ((CTGreaterThan 54) && (CTLessThan 60))){ //Light up 5
        five1.on;
    }
    
    if (((CTGreaterThan 14) && (CTLessThan 20)) || ((CTGreaterThan 44) && (CTLessThan 50))){ //Light up a quarter
        a.on; quarter.on;
    }
    
    if (((CTGreaterThan 29) && (CTLessThan 35))){ //Light up a half
        half.on
    }
    
    if (((CTGreaterThan 19) && (CTLessThan 30)) || ((CTGreaterThan 39) && (CTLessThan 45))){ //Light up twenty
        twenty.on;
    }
    
    if (((CTGreaterThan 24) && (CTLessThan 30)) || ((CTGreaterThan 34) && (CTLessThan 40))){ //Light up twenty five
        twenty.on; five1.on;
    }
    
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
    
    if (currentTime.min < 35){
        ((UILabel *)[self valueForKey:[delegate.hours valueForKey:hourString]]).on; //light up current hour
    }else{
        ((UILabel *)[self valueForKey:[delegate.hours valueForKey:nextHourString]]).on; //light up next hour
    }
    
    if ((currentTime.min >= 0) && (currentTime.min < 5)){ //On the hour
        oclock.on;
        ((UILabel *)[self valueForKey:[delegate.hours valueForKey:hourString]]).on;
    }
    
    [self pastTo:currentTime.min];
    [self getLabels:2]; //Check status of labels in view to determine if they should be on or off
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

-(void)getLabels:(int)type{
    for (UIView *view in self.view.subviews){
        if([view isKindOfClass:[UILabel class]]){
            UILabel *label = (UILabel*)view;
            if (type == 1){
                label.off;
            }else{
                if (label.enabled == TRUE){
                    label.textColor = onColor;
                    label.alpha = 1.0;
                }else{
                    label.textColor = onColor;
                    label.textColor = offColor;
                    if ((themeCount == 1) || (themeCount == 3)){
                        label.alpha = 0.3;
                    }else{
                        label.alpha = 0.45;
                    }
                }
            }
        }
    }
}

#pragma mark - Minute Dots -

-(void)initializeDots:(int)minute{
    NSArray *firstDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:6], [NSNumber numberWithInteger:11],[NSNumber numberWithInteger:16],[NSNumber numberWithInteger:21],[NSNumber numberWithInteger:26],[NSNumber numberWithInteger:31],[NSNumber numberWithInteger:36],[NSNumber numberWithInteger:41],[NSNumber numberWithInteger:46],[NSNumber numberWithInteger:51],[NSNumber numberWithInteger:56],nil];
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute]]){
        dotCount = 1;
    }
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute-1]]){
        dotCount = 2;
    }
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute-2]]){
        dotCount = 3;
    }
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute-3]]){
        dotCount = 4;
    }
}

-(void)dots{
    if (dotCount == 0){
        dot1.off; dot2.off; dot3.off; dot4.off;
    }else if (dotCount == 1){
        dot1.on;
    }else if (dotCount == 2){
        dot1.on; dot2.on;
    }else if (dotCount == 3){
        dot1.on; dot2.on; dot3.on;
    }else{
        dot1.on; dot2.on; dot3.on; dot4.on;
        dotCount = 0;
    }
    dotCount++;
}

#pragma mark - Themes -

-(IBAction)changeTheme{
    themeCount++;
    if (themeCount > 4) themeCount = 1;
    [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"theme%i",themeCount])];
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
    onColor = [UIColor colorWithRed:19.0/255.0 green:92.0/255.0 blue:242.0/255.0 alpha:1.0];
    offColor = [UIColor darkGrayColor];
}

-(void)theme4{
    self.view.backgroundColor = [UIColor whiteColor];
    onColor = [UIColor colorWithRed:19.0/255.0 green:92.0/255.0 blue:242.0/255.0 alpha:1.0];
}

@end