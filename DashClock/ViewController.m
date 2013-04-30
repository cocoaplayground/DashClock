//
//  ViewController.m
//  DashClock
//
//  Created by Chase Acton on 1/16/13.
//  Copyright (c) 2013 Chase Acton. All rights reserved.
//

#import "Settings.h"

@implementation ViewController
@synthesize onColor, offColor;

- (void)viewDidLoad{
    [super viewDidLoad];
    themeManager = [[ThemeManager alloc] init];
    timeComponents = [[TimeComponents alloc] init];
    struct DComps currentTime = [timeComponents getDateComponets];
    [self setupClock:currentTime.min]; //Setup dots, set initial colors and theme
    [self updateClock];
    [self performSelector:@selector(startClock) withObject:nil afterDelay:(secondsPerMinute - currentTime.sec)]; //Update clock once per minute, starting on the minute
}

#pragma mark - Clock Setup -

-(void)setupClock:(int)minute{
    [self initializeDots:minute];
    self.onColor = defaultOnColor;
    self.offColor = defaultOffColor;
}

-(void)startClock{
    [self updateClock];
    [NSTimer scheduledTimerWithTimeInterval:updatesPerMinute target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
}

#pragma mark - Main Clock Methods -

-(void)updateClock{
    struct DComps currentTime = [timeComponents getDateComponets];
    
    [self getLabels:1];
    it.on; is.on; //Always on
    [self dots]; //Setup minute dots
    
    if (((CTGreaterThan 9) && (CTLessThan 15)) || ((CTGreaterThan 49) && (CTLessThan 55))) //Light up 10
        ten1.on;
    
    if (((CTGreaterThan 4) && (CTLessThan 10)) || ((CTGreaterThan 54) && (CTLessThan 60))){ //Light up 5
        five1.on;
    }
    
    if (((CTGreaterThan 14) && (CTLessThan 20)) || ((CTGreaterThan 44) && (CTLessThan 50))) //Light up a quarter
        a.on; quarter.on;
    
    if (((CTGreaterThan 29) && (CTLessThan 35))){ //Light up a half
        half.on
    }
    
    if (((CTGreaterThan 19) && (CTLessThan 30)) || ((CTGreaterThan 39) && (CTLessThan 45))) //Light up twenty
        twenty.on;
    
    if (((CTGreaterThan 24) && (CTLessThan 30)) || ((CTGreaterThan 34) && (CTLessThan 40))){ //Light up twenty five
        twenty.on; five1.on;
    }
    
    NSString *hourString; //Current hour
    if (currentTime.hour > 12)
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour-12];
    else
        hourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    
    NSString *nextHourString; //Next hour
    if (currentTime.hour + 1 > 12)
        nextHourString = [NSString stringWithFormat:@"%i",currentTime.hour+1-12];
    else
        nextHourString = [NSString stringWithFormat:@"%i",currentTime.hour];
    
    if (currentTime.min < 35){
        ((UILabel *)[self valueForKey:[timeComponents.hours valueForKey:hourString]]).on; //light up current hour
    }else{
        ((UILabel *)[self valueForKey:[timeComponents.hours valueForKey:nextHourString]]).on; //light up next hour
    }
    
    if ((currentTime.min >= 0) && (currentTime.min < 5)){ //On the hour
        oclock.on;
        ((UILabel *)[self valueForKey:[timeComponents.hours valueForKey:hourString]]).on;
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
    }
    else if (minute >= 5)
        past.on;
}

-(void)getLabels:(int)type{
    for (UIView *view in self.view.subviews){
        if([view isKindOfClass:[UILabel class]]){
            UILabel *label = (UILabel*)view;
            if (type == 1){
                label.off;
            }else{
                if (label.enabled == TRUE){
                    label.textColor = self.onColor;
                    label.alpha = fullTextColor;
                }else{
                    label.textColor = self.onColor;
                    label.textColor = self.offColor;
                    if ((themeManager.themeCount == 1) || (themeManager.themeCount == 3)){
                        label.alpha = lightTextColor;
                    }else{
                        label.alpha = darkTextColor;
                    }
                }
            }
        }
    }
}

#pragma mark - Minute Dots -

-(void)initializeDots:(int)minute{
    NSArray *firstDots = [NSArray arrayWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:6], [NSNumber numberWithInteger:11],[NSNumber numberWithInteger:16],[NSNumber numberWithInteger:21],[NSNumber numberWithInteger:26],[NSNumber numberWithInteger:31],[NSNumber numberWithInteger:36],[NSNumber numberWithInteger:41],[NSNumber numberWithInteger:46],[NSNumber numberWithInteger:51],[NSNumber numberWithInteger:56],nil];
    if ([firstDots containsObject:[NSNumber numberWithInteger:minute]])
        dotCount = 1;
    else if ([firstDots containsObject:[NSNumber numberWithInteger:minute-1]])
        dotCount = 2;
    else if ([firstDots containsObject:[NSNumber numberWithInteger:minute-2]])
        dotCount = 3;
    else if ([firstDots containsObject:[NSNumber numberWithInteger:minute-3]])
        dotCount = 4;
    else
        dotCount = 0;
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

-(IBAction)cycleTheme{
    [themeManager changeTheme];
    self.view.backgroundColor = themeManager.backgroundColor;
    self.onColor = themeManager.onColor;
    self.offColor = themeManager.offColor;
    [self getLabels:2];
}

@end