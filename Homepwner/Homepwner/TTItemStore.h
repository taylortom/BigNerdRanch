//
//  TTItemStore.h
//  Homepwner
//
//  Created by Thomas Taylor on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTItem.h"

@interface TTItemStore : NSObject
{
    NSMutableArray* allItems;
}

+(TTItemStore*)sharedStore;

-(NSArray*)allItems;
-(TTItem*)createItem;

@end
