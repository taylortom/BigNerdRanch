//
//  HypnosisViewController.m
//  Hypnotime
//
//  Created by Thomas Taylor on 17/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    /*
     * a more explicit alternative to using:
     * [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]
     */
    NSBundle* appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"HypnosisViewController" bundle:appBundle];
    
    if(self)
    {
        // set the view's tab bar title
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        
        // set the tab bar's icon
        UIImage* icon = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:icon];    
    }
    
    return self;
}

-(void)loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView* view = [[HypnosisView alloc] initWithFrame:frame];
    [self setView:view];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded it's view");
    
    [[self view] setBackgroundColor:[UIColor purpleColor]];
}

@end
