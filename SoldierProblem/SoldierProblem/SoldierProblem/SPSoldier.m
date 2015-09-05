//
//  SPSoldier.m
//  SoldierProblem
//
//  Created by Developer on 15/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "SPSoldier.h"

@implementation SPSoldier

-(id)init{
    return [self initWithDefaults];
}

-(id)initWithDefaults{
    self=[super init];
    
    if(self)
    {
        _soldierID=0;
        _awake=NO;
        _reportiesSoldiers=[[NSMutableSet alloc]init];
    }
    return self;
}

-(void)setAttributes:(int)soldierID Status:(BOOL)awake Reporties:(NSNumber*)reporterID{
        self.soldierID=soldierID;
        self.awake=awake;
        [self.reportiesSoldiers addObject:reporterID];
}


-(NSMutableSet*) getReporties{
    return self.reportiesSoldiers;
}

-(void)addReporter:(NSNumber*)soldierID{
    [self.reportiesSoldiers addObject:soldierID];    
}

@end
