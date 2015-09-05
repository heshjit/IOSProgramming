//
//  HeadlinesTableViewController.h
//  RssReader
//
//  Created by Developer on 21/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSDownloader.h"
#import "ArticlesTableViewController.h"

@interface HeadlinesTableViewController : UITableViewController
@property NSArray* headlinesText;
@property NSArray* headlinesLink;
@end
