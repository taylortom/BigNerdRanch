//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Thomas Taylor on 21/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView* headerView;
}

-(UIView*)headerView;
-(IBAction)addNewItem:(id)sender;
-(IBAction)toggleEditingMode:(id)sender;

@end
