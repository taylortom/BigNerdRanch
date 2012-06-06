//
//  main.m
//  RandomPossessions
//
//  Created by Thomas Taylor on 06/06/2012.
//  Copyright (c) 2012 taylortom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool 
    {
        // the list of items
        NSMutableArray* items = [[NSMutableArray alloc] init];
        
        // create some items
        int totalItems = 25;
        for(int i = 0; i < totalItems; i++)
        {
            TTItem* randomItem = [TTItem randomItem];       
            [items addObject:randomItem];
        }
        
        // print out the items
        for (TTItem* item in items) 
            NSLog(@"%@", item);
        
        // delete the list
        items = nil;
    }
    return 0;
}

