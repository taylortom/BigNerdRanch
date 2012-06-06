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
    NSString* itemName;
    NSString* serialNumber;
    int valueInPounds;
    NSDate* dateCreated;
}

+(id)randomItem;

-(id)initWithItemName:(NSString*)_itemName valueInPounds:(int)_valueInPounds serialNumber:(NSString*)_serialNumber;

-(void)setItemName:(NSString*)_itemName;
-(NSString*)itemName;

-(void)setSerialNumber:(NSString*)_serialNumber;
-(NSString*)serialNumber;

-(void)setValueInPounds:(int)_valueInPounds;
-(int)valueInPounds;

-(NSDate*)dateCreated;

@end
