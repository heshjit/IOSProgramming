//
//  SPSoldier.h
//  SoldierProblem
//
//  Created by Developer on 15/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPSoldier : NSObject
@property NSMutableSet* reportiesSoldiers;
@property BOOL awake;
@property int soldierID;

#pragma Initializers
-(id)init;
-(id)initWithDefaults;
-(void)setAttributes:(int)soldierID Status:(BOOL)awake Reporties:(NSNumber*)reporterID;

#pragma object Functions
-(NSSet*) getReporties;

@end
