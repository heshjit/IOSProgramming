//
//  RSSXMLParser.m
//  RssReader
//
//  Created by Developer on 23/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "RSSXMLParser.h"
#import "RSSArticle.h"

@interface RSSXMLParser ()
@property NSString *element;

@property NSString *currentArticleTitle;
@property NSURL *currentArticleLink;
@property NSData *rssXmlData;
@end

@implementation RSSXMLParser

-(id)initWithRssData:(NSData *)rssData
{
    self = [super init];
    if (self) {
        _rssXmlData=rssData;
        _articleArray=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)parseArticleRSSData
{
    self.parser = [[NSXMLParser alloc]initWithData:self.rssXmlData];
    self.parser.delegate = self;
    [self.parser parse];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    self.element = elementName;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        RSSArticle *thisArticle = [[RSSArticle alloc]initWithTitle:self.currentArticleTitle link:self.currentArticleLink];
        [self.articleArray addObject:thisArticle];
    }
    self.element = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if([self.element isEqualToString:@"title"])
    {
        self.currentArticleTitle = string;
    }
    else if([self.element isEqualToString:@"link"])
    {
        self.currentArticleLink = [[NSURL alloc]initWithString:string];
    }
    else
        //NSLog(@"Unknown element: %@",self.element);
        ;
}

@end
