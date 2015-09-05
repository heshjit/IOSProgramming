//
//  RSSArticles.h
//  RssReader
//
//  Created by Developer on 23/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSArticle : NSObject
@property NSString *articleTitle;
@property NSURL *articleLink;

-(id)initWithTitle:(NSString*)title link:(NSURL*)link;
@end
