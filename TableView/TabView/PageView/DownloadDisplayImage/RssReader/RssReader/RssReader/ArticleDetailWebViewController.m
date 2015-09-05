//
//  ArticleDetailWebViewController.m
//  RssReader
//
//  Created by Developer on 24/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "ArticleDetailWebViewController.h"

@interface ArticleDetailWebViewController ()

@end

@implementation ArticleDetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:self.webUrl];
    [self.DetailViewActivityLoader startAnimating];
    [self.webView loadRequest:requestUrl];
    [self.DetailViewActivityLoader stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue identifier] isEqualToString:@")
}
 */


@end
