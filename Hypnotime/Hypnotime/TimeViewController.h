//
//  TimeViewController.h
//  Hypnotime
//
//  Created by Thomas Taylor on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel* timeLabel;
}

-(IBAction)showCurrentTime:(id)sender;

@end
