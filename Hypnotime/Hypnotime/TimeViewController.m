//
//  TimeViewController.m
//  Hypnotime
//
//  Created by Thomas Taylor on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        // set the view's tab bar title
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];
        
        // set the tab bar's icon
        UIImage* icon = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:icon];
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded it's view");
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    NSLog(@"Unloading TimeViewController's subviews");
    NSLog(@"timeLabel: %@", timeLabel);
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"TimeViewController: viewWillAppear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"TimeViewController: viewWillDisappear");    
}

-(IBAction)showCurrentTime:(id)sender
{
    NSDate* now = [NSDate date];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [timeLabel setText:[formatter stringFromDate:now]];
}

@end
