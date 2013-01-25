//
// Settings.h
//
// Created by Chase Acton
//

//Imports
#import "ViewController.h"
#import "AppDelegate.h"
#define delegate ((AppDelegate *)[[UIApplication sharedApplication] delegate]) //Allow access to the delegate from all classes

#define on enabled = TRUE;
#define off enabled = FALSE;

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

//Unused code

/*enum{
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
}decryptEnum;*/

//Unused random method
/*-(void)randomBlink{
 int alpha = arc4random() % 5;
 it.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 is.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 one.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 two.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 three.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 four.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 five1.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 five2.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 six.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 seven.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 eight.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 nine.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 ten1.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 ten2.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 eleven.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 twenty.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 a.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 quarter.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 to.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 past.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 am.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 pm.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 past.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 twelve.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 oclock.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 half.textColor = [UIColor colorWithRed:((arc4random() % 255 )/255.0) green:((arc4random() % 255 )/255.0) blue:((arc4random() % 255 )/255.0)alpha:alpha];
 }*/