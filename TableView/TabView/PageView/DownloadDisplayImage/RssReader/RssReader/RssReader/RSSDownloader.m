//
//  DownloadUsingSession.m
//  RssReader
//
//  Created by Developer on 21/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "RSSDownloader.h"

@interface RSSDownloader()
@property NSURL *url;
@property NSString *saveFileName;

@property NSURLSessionDownloadTask *task;
@end

@implementation RSSDownloader

-(id)init{
    self = [super init];
    if(self){
        _url=nil;
        _saveFileName=nil;
        _error=nil;
    }
    return self;
}

- (NSURL *)documentsDirectoryURL
{
    NSError *error = nil;
    NSURL *url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                        inDomain:NSUserDomainMask
                                               appropriateForURL:nil
                                                          create:NO
                                                           error:&error];
    if (error) {
        // Figure out what went wrong and handle the error.
    }
    
    return url;
}

-(void)downloadContentFromURL:(NSURL*)url saveFileName:(NSString*)fileName{
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // Use a session with a custom configuration
    self.session = [NSURLSession sessionWithConfiguration:self.configuration];
    self.error=nil;
    self.url=url;
    self.saveFileName=fileName;
    __block NSData* blockData;
    __block NSError *blockError;
    __block BOOL writeWasSuccessful=NO;
    __weak RSSDownloader * thisDownloadUsingSession = self;
    // Create the download task passing in the URL of the image.
     self.task = [self.session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        // Get information about the response if neccessary.
         if (error){
             blockError=error;
         }
        else{
            NSError *openDataError = nil;
            blockData = [NSData dataWithContentsOfURL:location
                                                           options:kNilOptions
                                                             error:&openDataError];
            if (openDataError) {
                blockError=openDataError;
            }
            else
            {
                // Get the path of the application's documents directory.
                NSURL *documentsDirectoryURL = [thisDownloadUsingSession documentsDirectoryURL];
                // Append the desired file name to the documents directory path.
                NSURL *saveLocation = [documentsDirectoryURL URLByAppendingPathComponent:fileName];
                NSError *saveError = nil;
                
                writeWasSuccessful = [blockData writeToURL:saveLocation
                                                             options:kNilOptions
                                                               error:&saveError];
                // Successful or not we need to stop the activity indicator, so switch back the the main thread.
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(saveError)
                        blockError=saveError;
                    
                    if(writeWasSuccessful)
                    {
                        blockData = [self readDownloadFile:fileName];
                        NSLog(@"%@",blockData);
                    }
                });

            }
        }
    }];
}

-(void)downloadContentFromURL:(NSURL*)url{
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // Use a session with a custom configuration
    self.session = [NSURLSession sessionWithConfiguration:self.configuration];
    self.error=nil;
    self.url=url;
    self.saveFileName=nil;
    __block NSData *blockData;
    __block NSError *blockError;
    // Create the download task passing in the URL of the image.
    self.task = [self.session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        // Get information about the response if neccessary.
        if (error){
            blockError=error;
        }
        else{
            NSError *openDataError = nil;
            blockData = [NSData dataWithContentsOfURL:location
                                              options:kNilOptions
                                                error:&openDataError];
            if (openDataError) {
                blockError=openDataError;
            }
            else
            {
                if ([self.downloaderDelegate respondsToSelector:@selector(downloadComplete:ForURL:)]) {
                    [self.downloaderDelegate downloadComplete:blockData ForURL:url];
                }
           }
        }
    }];
}

-(void)cancelDownload{
    [self.task cancel];
}

-(void)resumeDownload{
    [self.task resume];
}

-(void)suspendDownload{
    [self.task suspend];
}

-(NSURLSessionTaskState)getState{
    return self.task.state;
}

-(NSData*)readDownloadFile:(NSString*)fileName{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectoryURL = [self documentsDirectoryURL];
    // Append the desired file name to the documents directory path.
    NSURL *saveLocation = [documentsDirectoryURL URLByAppendingPathComponent:fileName];
    if ([fileManager fileExistsAtPath:[saveLocation path]]){
         return [NSData dataWithContentsOfURL:saveLocation];
    }
    return nil;
}

@end
