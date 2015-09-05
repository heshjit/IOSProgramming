//
//  ArticlesTableViewController.h
//  RssReader
//
//  Created by Developer on 23/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSDownloader.h"
#import "RSSXMLParser.h"

@interface ArticlesTableViewController : UITableViewController<RSSDownloaderDelegate>
@property NSURL *xmlUrl;
@property RSSDownloader *downloader;
@property RSSXMLParser *xmlParser;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityLoadIndicator;

@end
