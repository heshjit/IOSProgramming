//
//  RSSArticles.m
//  RssReader
//
//  Created by Developer on 23/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "RSSArticle.h"

@implementation RSSArticle

-(id)initWithTitle:(NSString*)title link:(NSURL*)link
{
    self = [super init];
    if (self) {
        _articleTitle=title;
        _articleLink=link;
    }
    return self;
}
@end
