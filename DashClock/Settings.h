//
// Settings.h
//
// Created by Chase Acton
//

#pragma mark - Imports -

#import "AppDelegate.h"
#define delegate ((AppDelegate *)[[UIApplication sharedApplication] delegate]) //Allow access to the delegate from all classes

#pragma mark - Other -

struct DComps{ //Struct to hold date and time information
    int year;
    int month;
    int day;
    int hour;
    int min;
    int sec;
};