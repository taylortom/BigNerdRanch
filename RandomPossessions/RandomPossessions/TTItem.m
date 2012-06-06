//
//  TTItem.m
//  RandomPossessions
//
//  Created by Thomas Taylor on 06/06/2012.
//  Copyright (c) 2012 taylortom. All rights reserved.
//

#import "TTItem.h"

@implementation TTItem

+(id)randomItem
{
    NSArray* randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                                             @"Shiny",
                                                             @"Rusty",
                                                             @"Broken",
                                                             @"Disheveled",
                                                             @"Stringy",
                                                             @"Large",
                                                             @"Mint-condition",
                                                             @"Second-hand",
                                                             @"Stretchy",
                                    nil];
    
    NSArray* randomNounList = [NSArray arrayWithObjects:@"47-inch LED TV",
                                                        @"Macbook",
                                                        @"Fax machine",
                                                        @"Rag-rug",
                                                        @"Washing machine",
                                                        @"Stove",
                                                        @"Wash-basin",
                                                        @"Lava lamp",
                                                        @"Bowling ball",
                                                        @"Pocket watch",
                                    nil];
    
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    NSString* randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 1000;
    
    NSString* randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + rand() % 10, 'A' + rand() % 26, '0' + rand() % 10, 'A' + rand() % 26, '0' + rand() % 10];
    
    TTItem* randomItem = [[TTItem alloc] initWithItemName:randomName valueInPounds:randomValue serialNumber:randomSerialNumber];
    return randomItem;
}

-(id)init
{
    return [self initWithItemName:@"Item" valueInPounds:0 serialNumber:@""];
}

-(id)initWithItemName:(NSString*)_itemName valueInPounds:(int)_valueInPounds serialNumber:(NSString*)_serialNumber
{
    self = [super init];
    
    if(self)
    {
        [self setItemName:_itemName];
        [self setValueInPounds:_valueInPounds];
        [self setSerialNumber:_serialNumber];
        
        dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"%@ (%@): Worth £%d, recorded on %@", itemName, serialNumber, valueInPounds, dateCreated];
}

/**
 * Sets the item's name
 */
-(void)setItemName:(NSString*)_itemName
{
    itemName = _itemName;
}

/**
 * Returns the item's name
 */
-(NSString*)itemName
{
    return itemName;
}

/**
 * Sets the item's serial number
 */
-(void)setSerialNumber:(NSString*)_serialNumber
{
    serialNumber = _serialNumber;
}

/**
 * Returns the item's serial number
 */
-(NSString*)serialNumber
{
    return serialNumber;
}

/**
 * Sets the item's value
 */
-(void)setValueInPounds:(int)_valueInPounds
{
    valueInPounds = _valueInPounds;
}

/**
 * Returns the item's value
 */
-(int)valueInPounds
{
    return valueInPounds;
}

/**
 * Returns the date that the item was created
 */
-(NSDate*)dateCreated
{
    return dateCreated;
}

@end
