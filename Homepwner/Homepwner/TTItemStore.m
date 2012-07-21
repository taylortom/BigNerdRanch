//
//  TTItemStore.m
//  Homepwner
//
//  Created by Thomas Taylor on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TTItemStore.h"

@implementation TTItemStore

+(TTItemStore*)sharedStore
{
    static TTItemStore* sharedStore = nil;
    if(!sharedStore) 
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

-(id)init
{
    self = [super init];
    
    if(self)
    {
        allItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSArray*)allItems
{
    return allItems;
}

-(TTItem*)createItem
{
    TTItem* item = [TTItem randomItem];
    [allItems addObject:item];
    return item;
}

@end
