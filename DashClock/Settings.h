//
// Settings.h
//
// Created by Chase Acton
//

//Imports
#import "ViewController.h"
#import "Constants.h"
#import "AppDelegate.h"
#define delegate ((AppDelegate *)[[UIApplication sharedApplication] delegate]) //Allow access to the delegate from all classes

#define on enabled = TRUE;
#define off enabled = FALSE;

#define defaultOnColor [UIColor whiteColor]
#define defaultOffColor [UIColor blackColor]

//Time Camparison Macros
#define CTLessThan currentTime.min <
#define CTGreaterThan currentTime.min > 

struct DComps{ //Struct to hold date and time information
    int year;
    int month;
    int day;
    int hour;
    int min;
    int sec;
};
