//
// Settings.h
//
// Created by Chase Acton
//

#pragma mark - Imports -

#import "ViewController.h"
#import "AppDelegate.h"
#define delegate ((AppDelegate *)[[UIApplication sharedApplication] delegate]) //Allow access to the delegate from allclasses
#define on textColor = onColor;
#define off textColor = offColor;


/// Time Camparison Macros

//min
#define CTLessThan currentTime.min <
#define CTGreaterThan currentTime.min > 

#pragma mark - Other -

struct DComps{ //Struct to hold date and time information
    int year;
    int month;
    int day;
    int hour;
    int min;
    int sec;
};

enum{
    a,
    quarter,
    twenty,
    five1,
    half = 10,
    ten1,
    to,
    past,
    nine,
    one,
    two,
    three,
    four,
    five2,
    eight,
    eleven,
    seven,
    twelve,
    ten2,
    oclock
}decryptEnum;
