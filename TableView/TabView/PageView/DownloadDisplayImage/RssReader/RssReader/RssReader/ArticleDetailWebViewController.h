//
//  ArticleDetailWebViewController.h
//  RssReader
//
//  Created by Developer on 24/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleDetailWebViewController : UIViewController
@property NSURL *webUrl;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *DetailViewActivityLoader;
@end
