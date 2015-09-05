//
//  main.m
//  SoldierProblem
//
//  Created by Developer on 15/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int numberOfSoldiers=0;
        int intSuperiorID=0;
        int orderTypes=0;
        int typeID=0;
        int intSoldierID=0;
        scanf("%d",&numberOfSoldiers);
        
        int counter=1;
        SPManager *manager = [[SPManager alloc]init];
        [manager createSoldier:numberOfSoldiers];
        
        while(counter<=numberOfSoldiers){
            scanf("%d",&intSuperiorID);
            NSNumber *superiorID = [NSNumber numberWithInt:intSuperiorID];
            [manager setSoldierID:counter awakeStatus:YES reporty:superiorID];
            counter++;
        }
        
        scanf("%d",&orderTypes);
        counter=1;
        while (counter<=orderTypes) {
            scanf("%d %d",&typeID,&intSoldierID);
            NSNumber* soldierID=[NSNumber numberWithInt:intSoldierID];
            counter++;
            if(typeID==1)
            {
                [manager setAsAwake:soldierID];
            }
            else if(typeID==2)
            {
                [manager setAsSleep:soldierID];
            }
            else if (typeID==3)
            {
                NSLog(@"%d",[manager getAwakeSoldiersCount:soldierID]);
            }
            else
                NSLog(@"Invalid Order ID");
        }
    }
    return 0;
}
