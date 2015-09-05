//
//  main.m
//  InterviewTest2
//
//  Created by Developer on 17/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolutionClass:NSObject
/* method declaration */
- (BOOL)isWordA:(NSString*)wordA anagramOfWordB:(NSString*)wordB;
@end


@implementation SolutionClass
/* method implementation */
- (BOOL)isWordA:(NSString*)wordA anagramOfWordB:(NSString*)wordB
{
    /*
     * Complete this function.
     */
    int indexOfWord=0;
    if([wordA length] != [wordB length])
        return NO;
    else{
        NSMutableString *newWord = [[NSMutableString alloc]initWithString:wordA];
        while ([wordB length]>indexOfWord) {
            NSRange *range = [NSMakeRange(0,1)];
//            NSString *indexWord = [wordB substringWithRange:[NSMakeRange(0, 1)]];
            NSString *indexWord = [wordB substringWithRange:range];
        [newWord stringByReplacingOccurrencesOfString:indexWord withString:@""];
            ++indexOfWord;
        }
        
    }
  
    return NO;
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        char text[1024];
        
        scanf("%s", text);
        NSString *wordA = [NSString stringWithCString:text encoding:NSASCIIStringEncoding];
        
        scanf("%s", text);
        NSString *wordB = [NSString stringWithCString:text encoding:NSASCIIStringEncoding];
        
        SolutionClass *solution = [SolutionClass new];
        BOOL isAnagram = [solution isWordA:wordA anagramOfWordB:wordB];
        
        printf("%s", solution ? [@"true" UTF8String] : [@"false" UTF8String]);
        
        
    }
    return 0;
}
