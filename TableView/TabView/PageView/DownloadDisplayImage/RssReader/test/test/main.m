//
//  main.m
//  test
//
//  Created by Developer on 24/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int invoke(int argc, char* argv[])
{
    int ret = 0;
    @try {
    ret = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    @catch(NSException * e) {
        
    }
    ret = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    return ret;
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        int ret = invoke(argc, argv);
        return ret;
    }
}
