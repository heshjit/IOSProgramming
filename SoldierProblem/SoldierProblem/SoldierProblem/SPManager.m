//
//  SPManager.m
//  SoldierProblem
//
//  Created by Developer on 15/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "SPManager.h"

@implementation SPManager

-(id)init{
    self = [super init];
    
    if(self){
        _key=1;
        _soldiersList=[[NSMutableDictionary alloc]init];
    }
    return self;
}

-(void)createSoldier:(int)numberOfSoldiers{
    if(numberOfSoldiers>0){
        int counter=1;
        while(counter<=numberOfSoldiers){
            SPSoldier* soldier = [[SPSoldier alloc]init];
            NSNumber* keyForSoldier = [NSNumber numberWithInt:self.key];
            [self.soldiersList setObject:soldier forKey:keyForSoldier];
            self.key++;
            counter++;
        }
    }
}

-(void)setSoldierID:(int)soldierID awakeStatus:(BOOL)awake reporty:(NSNumber*)reporterID{
    NSNumber* soldierIdentity = [NSNumber numberWithInt:soldierID];
    [[self getSoldier:soldierIdentity]setAttributes:soldierID Status:awake Reporties:reporterID];
}

-(SPSoldier*)getSoldier:(NSNumber*) soldierID{
    return     [self.soldiersList objectForKey:soldierID];
}

-(void)setAsAwake:(NSNumber*) soldierID{
    SPSoldier* soldier = [self getSoldier:soldierID];
    
    NSEnumerator *enumerator = [[soldier reportiesSoldiers] objectEnumerator];
    
    NSNumber* soldierToSetNumber;
    
    while ((soldierToSetNumber = [enumerator nextObject])) {
        [self getSoldier:soldierToSetNumber].awake=YES;
    }
}

-(void)setAsSleep:(NSNumber*) soldierID{
    SPSoldier* soldier = [self getSoldier:soldierID];
    
    NSEnumerator *enumerator = [[soldier reportiesSoldiers] objectEnumerator];
    
    NSNumber* soldierToSetNumber;
    
    while ((soldierToSetNumber = [enumerator nextObject])) {
        [self getSoldier:soldierToSetNumber].awake=NO;
    }
}

-(int)getAwakeSoldiersCount:(NSNumber*)soldierID{
    SPSoldier* soldier = [self getSoldier:soldierID];
    int counter=0;
    
    NSEnumerator *enumerator = [[soldier reportiesSoldiers] objectEnumerator];
    
    NSNumber* soldierToSetNumber;
    
    while ((soldierToSetNumber = [enumerator nextObject])) {
        if ([[self getSoldier:soldierToSetNumber] awake] == YES) {
            counter++;
        }
    }
    
    return counter;
}

-(int)getSleepingSoldierCount:(NSNumber*)soldierID{
    SPSoldier* soldier = [self getSoldier:soldierID];
    int counter=0;
    
    NSEnumerator *enumerator = [[soldier reportiesSoldiers] objectEnumerator];
    
    SPSoldier* soldierToSet;
    
    while ((soldierToSet = [enumerator nextObject])) {
        if ([soldierToSet awake] == NO) {
            counter++;
        }
    }
    return counter;
}

@end
