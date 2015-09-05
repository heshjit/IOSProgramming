//
//  RSSXMLParser.h
//  RssReader
//
//  Created by Developer on 23/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSXMLParser : NSObject <NSXMLParserDelegate>
@property NSMutableArray *articleArray;
@property NSXMLParser *parser;

-(id)initWithRssData:(NSData*)rssData;
-(void)parseArticleRSSData;
@end
