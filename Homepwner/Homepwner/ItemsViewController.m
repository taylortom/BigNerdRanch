//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Thomas Taylor on 21/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "TTItemStore.h"
#import "TTItem.h"

@implementation ItemsViewController

-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if(self)
    {
        for (int i = 0; i < 50; i++) 
        {
            [[TTItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TTItemStore sharedStore] allItems] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TTItem* item = [[[TTItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];

    // create the cell
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];

    // set the cell data
    [[cell textLabel] setText:[item description]];
    
    return cell;
}

@end
