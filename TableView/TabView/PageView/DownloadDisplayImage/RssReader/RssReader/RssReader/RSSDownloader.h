//
//  DownloadUsingSession.h
//  RssReader
//
//  Created by Developer on 21/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSDownloaderDelegate<NSObject>
- (void)downloadComplete:(NSData *)data ForURL:(NSURL *)url;

@end
@interface RSSDownloader : NSObject

@property NSError *error;
@property __block NSData *data;
@property NSURLSession *session;
@property NSURLSessionConfiguration *configuration;
@property (weak) id downloaderDelegate;


-(void)downloadContentFromURL:(NSURL*)url saveFileName:(NSString*)fileName;
-(void)downloadContentFromURL:(NSURL*)url;
-(void)cancelDownload;
-(void)resumeDownload;
-(void)suspendDownload;
-(NSURLSessionTaskState)getState;
- (NSURL *)documentsDirectoryURL;
-(NSData*)readDownloadFile:(NSString*)fileName;
@end

