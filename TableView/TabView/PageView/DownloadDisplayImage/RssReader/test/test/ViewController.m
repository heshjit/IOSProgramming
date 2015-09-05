//
//  ViewController.m
//  test
//
//  Created by Developer on 24/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:10 target:self selector:@selector(abort) userInfo:nil repeats:NO];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:timer forMode: NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) abort {
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
}

@end
