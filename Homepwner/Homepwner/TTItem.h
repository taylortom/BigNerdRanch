//
//  TTItem.h
//  RandomPossessions
//
//  Created by Thomas Taylor on 06/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTItem : NSObject
{
}

+(id)randomItem;

-(id)initWithItemName:(NSString*)_itemName valueInPounds:(int)_valueInPounds serialNumber:(NSString*)_serialNumber;

@property (nonatomic, strong) TTItem* containedItem;
@property (nonatomic, weak) TTItem* container;

@property (nonatomic, copy) NSString* itemName;
@property (nonatomic, copy) NSString* serialNumber;
@property (nonatomic) int valueInPounds;
@property (nonatomic, readonly, strong) NSDate* dateCreated;

@end
