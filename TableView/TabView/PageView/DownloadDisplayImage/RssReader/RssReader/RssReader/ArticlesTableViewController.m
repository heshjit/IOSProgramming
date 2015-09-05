//
//  ArticlesTableViewController.m
//  RssReader
//
//  Created by Developer on 23/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "ArticlesTableViewController.h"
#import "RSSArticle.h"
#import "ArticleDetailWebViewController.h"


@interface ArticlesTableViewController ()

@end

@implementation ArticlesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.activityLoadIndicator startAnimating];
    self.downloader = [[RSSDownloader alloc]init];
    [self.downloader setDownloaderDelegate:self];
    [self.downloader downloadContentFromURL:self.xmlUrl];
    [self.downloader resumeDownload];
    //[self.activityLoadIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)downloadComplete:(NSData *)downloadedData ForURL:(NSURL *)url {
    //[self.activityLoadIndicator startAnimating];
    self.xmlParser = [[RSSXMLParser alloc]initWithRssData:downloadedData];
    [self.xmlParser parseArticleRSSData];
    //for (id object in [self.xmlParser articleArray]) {
        //NSLog(@"Title: %@, Link: %@", [(RSSArticle*)object articleTitle],[(RSSArticle*)object articleLink]);
    //}
    [self.activityLoadIndicator stopAnimating];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //NSLog(@"%lu",[self.xmlParser.articleArray count]);
    return [self.xmlParser.articleArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"ArticleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    // Configure the cell...
    //NSLog(@"%@",[[self.xmlParser.articleArray objectAtIndex:[indexPath row]] articleArray]);
    cell.textLabel.text = [[self.xmlParser.articleArray objectAtIndex:[indexPath row]] articleTitle];
    return cell;
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
    if([[segue identifier] isEqualToString:@"WebRender"])
    {
        ArticleDetailWebViewController *webView = [segue destinationViewController];
        NSUInteger index=[[self.tableView indexPathForSelectedRow] row];
        webView.webUrl = [[self.xmlParser.articleArray objectAtIndex:index] articleLink];        
    }
}


@end
