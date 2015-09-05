//
//  HeadlinesTableViewController.m
//  RssReader
//
//  Created by Developer on 21/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "HeadlinesTableViewController.h"
#import "RSSDownloader.h"

@interface HeadlinesTableViewController ()

@end

@implementation HeadlinesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.headlinesText = [NSArray arrayWithObjects:
                          @"Top Stories",
                          @"Politics",
                          @"NSW News",
                          @"World",
                          @"National",
                          @"Comment",
                          @"Business",
                          @"Entertainment",
                          @"Business",
                          @"Technology",
                          @"IT PRO",
                          @"Weather",
                          @"Real Estate News",
                          @"Education",
                          @"Health",
                          @"Sports",
                          @"Rugby leagues",
                          @"Rugby Union",
                          @"AFL",
                          @"FootBall",
                          @"Cricket",
                                nil];
    
    self.headlinesLink = [NSArray arrayWithObjects:
                          @"http://feeds.smh.com.au/rssheadlines/top.xml",
                          @"http://www.smh.com.au/rssheadlines/federal-politics/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/nsw/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/world/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/national/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/comment/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/business/article/rss.xml",
                          @"http://feeds.smh.com.au/rssheadlines/entertainment.xml",
                          @"http://www.smh.com.au/rssheadlines/digital-life-news/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/technology-news/article/rss.xml",
                          @"http://feeds.smh.com.au/rssheadlines/itpro.xml",
                          @"http://www.smh.com.au/rssheadlines/weather/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/real-estate-news/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/education/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/health/article/rss.xml",
                          @"http://feeds.smh.com.au/rssheadlines/sport.xml",
                          @"http://www.smh.com.au/rssheadlines/league-news/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/union-news/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/afl-news/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/soccer/article/rss.xml",
                          @"http://www.smh.com.au/rssheadlines/cricket/article/rss.xml",
                          nil];
    /*
    [self.headlinesActivityIndicator startAnimating];
    for (id object in self.headlinesLink)
    {
        NSURL *url = [NSURL URLWithString:(NSString*)object];
        [self.downloader downloadContentFromURL:url];
        [self.downloader resumeDownload];
    }
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headlinesText.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName=@"headlineCell";
    UITableViewCell *headlineCell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];

    // Configure the cell...
    headlineCell.textLabel.text=[self.headlinesText objectAtIndex:indexPath.row];
    return headlineCell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ShowArticles"]) {
        NSURL *url = [NSURL URLWithString:(NSString*)[self.headlinesLink objectAtIndex:[[self.tableView indexPathForSelectedRow] row]]];
        ArticlesTableViewController *vController=[segue destinationViewController];
        vController.xmlUrl = url;
    }
}


@end
