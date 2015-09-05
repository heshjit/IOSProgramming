//
//  SPManager.h
//  SoldierProblem
//
//  Created by Developer on 15/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPSoldier.h"

@interface SPManager : NSObject

@property int key;
@property NSMutableDictionary* soldiersList;

-(id)init;
-(void)setAsAwake:(NSNumber*) soldierID;
-(void)setAsSleep:(NSNumber*) soldierID;
-(void)setSoldierID:(int)soldierID awakeStatus:(BOOL)awake reporty:(NSNumber*)reporterID;

-(int)getAwakeSoldiersCount:(NSNumber*)soldierID;
-(int)getSleepingSoldierCount:(NSNumber*)soldierID;
-(SPSoldier*)getSoldier:(NSNumber*) soldierID;
-(void)createSoldier:(int) numberOfSoldiers;
@end
