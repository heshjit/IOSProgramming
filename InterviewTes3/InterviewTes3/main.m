//
//  main.m
//  InterviewTes3
//
//  Created by Developer on 17/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolutionClass:NSObject
/* method declaration */
+ (int)numberOfPairsInNumbers:(NSArray*)numbers withDifference:(int)difference;
+(int)differenceCalculator:(int) firstNumber nextNumber:(int)nextnum;
@end


@implementation SolutionClass
+(int)differenceCalculator:(int)firstNumber nextNumber:(int)nextnum
{
    //if(firstNumber>nextnum)
      //return firstNumber-nextnum;
    return nextnum-firstNumber;
}

/* method implementation */
+ (int)numberOfPairsInNumbers:(NSArray*)numbers withDifference:(int)difference
{
    int diffrenceCounter=0;
    int outerIndex=0, innerIndex=0;
    if([numbers count]<=1)
        return 0;
    
    for(outerIndex=0;outerIndex<[numbers count];++outerIndex)
        for (innerIndex=0;innerIndex<[numbers count];++innerIndex) {
            //printf("(%d,%d)\n",[(NSNumber*)[numbers objectAtIndex:outerIndex]intValue],[(NSNumber*)[numbers objectAtIndex:innerIndex]intValue]);
            if((innerIndex!=outerIndex) && ([self differenceCalculator:[(NSNumber *)[numbers objectAtIndex:outerIndex]intValue] nextNumber:[(NSNumber*)[numbers objectAtIndex:innerIndex]intValue]] == difference))
            {
                //printf("Answer(%d,%d)\n",[(NSNumber*)[numbers objectAtIndex:outerIndex]intValue],[(NSNumber*)[numbers objectAtIndex:innerIndex]intValue]);
               ++diffrenceCounter;
            }
        }

       return diffrenceCounter;
}
@end

BOOL checkDuplicate(NSMutableArray* array, int item){
    NSEnumerator *enumerator = [array objectEnumerator];
    id arObject;
    
    while (arObject = [enumerator nextObject]) {
        if(([(NSNumber*)arObject intValue])==item)
            return YES;
    }
    return NO;
}

int main()
{
    @autoreleasepool {
        int arraySize;
        
        scanf("%i\n", &arraySize);
        //int array[arraySize];
        NSMutableArray* array=[[NSMutableArray alloc]init];
        
        for(int i = 0; i < arraySize; ++i)
        {
            int item;
            scanf("%i", &item);
            if(!checkDuplicate(array, item))
                [array addObject:[NSNumber numberWithInt:item]];
        }
        
        int difference;
        scanf("%i", &difference);
        
        int res = [SolutionClass numberOfPairsInNumbers:array withDifference:difference];
        printf("%i", res);
    }
    
    return 0;
}
