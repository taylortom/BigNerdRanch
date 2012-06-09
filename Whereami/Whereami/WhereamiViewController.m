//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Thomas Taylor on 08/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
                
        // set the delegate (gives warning)
        [locationManager setDelegate:self];
        
        // set the accuracy
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // start the location checker
        [locationManager startUpdatingLocation];
    }
    
    return self;
}

-(void)locationManager:(CLLocationManager*)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
}

-(void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

@end
