//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Thomas Taylor on 08/06/2012.
//  Copyright (c) 2012 taylortom. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(void)dealloc
{
    [locationManager setDelegate:nil];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        // initialise the object
        locationManager = [[CLLocationManager alloc] init];
        
        // set the delegate
        [locationManager setDelegate:self];
        
        // set the accuracy and sensitivity
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager setDistanceFilter:50];
        
        // start the location checker
        [locationManager startUpdatingLocation];
        
        // start the heading checker (providing devices supports it...)
        if([CLLocationManager headingAvailable]) [locationManager startUpdatingHeading];
        else NSLog(@"Uh-oh, device doesn't have a compass...");
    }
    
    return self;
}

-(void)locationManager:(CLLocationManager*)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"didUpdateHeading: %@", newHeading);
}

-(void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

@end
