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
        
        // start the heading checker (providing devices supports it...)
        [locationManager setHeadingFilter:90];
        if([CLLocationManager headingAvailable]) [locationManager startUpdatingHeading];
        else NSLog(@"Warning: heading updates unavailable");
    }
    
    return self;
}

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{    
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250);
    [worldView setRegion:zoomRegion animated:YES];
}

-(void)locationManager:(CLLocationManager*)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    
    // don't bother using old data
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if(t < -180) return;
    
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"didUpdateHeading: %@", newHeading);
}

-(void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)_location
{
    // store the coordinate
    CLLocationCoordinate2D coord = [_location coordinate];
    
    // create the annotation and add to map
    TTMapPoint* mp = [[TTMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    [worldView addAnnotation:mp];
    
    // zoom to the annotation area
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

@end
