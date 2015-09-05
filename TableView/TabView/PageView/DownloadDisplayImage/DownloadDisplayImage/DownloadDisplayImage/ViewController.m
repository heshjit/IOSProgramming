//
//  ViewController.m
//  DownloadDisplayImage
//
//  Created by Developer on 19/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self.activityAnimator setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSURL*)documentsDirectoryURL{
    NSError *error;
    NSURL *url=[[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:&error];
    if(error)
    {
        self.errorLable.text=[error localizedDescription];
    }
    return url;
}


-(void)retrieveImage:(id)sender{

#if 0   //Set to 1 if NSCollection is to be used.
    [self.activityAnimator startAnimating];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        NSURL *imageURL=[NSURL URLWithString:self.urlTextBox.text];
        
        NSError *downloadError=nil;
        
        NSData *imageData=[NSData dataWithContentsOfURL:imageURL
                                                options:kNilOptions
                                                error:&downloadError];
        
        if(downloadError){
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activityAnimator stopAnimating];
                //NSLog(@"%@",[downloadError localizedDescription]);
                self.errorLable.text=[downloadError localizedDescription];
            });
        }
        else{
            NSURL *documentDirectoryUrl = [self documentsDirectoryURL];
            
            NSURL *saveLocation = [documentDirectoryUrl URLByAppendingPathComponent:@"IMG.jpg"];

            NSError *saveError=nil;
            BOOL writeWasSuccessful = [imageData writeToURL:saveLocation options:kNilOptions error:&saveError];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(writeWasSuccessful){
                    NSData *imageData = [NSData dataWithContentsOfURL:saveLocation];
                    self.ImageDisplay.image = [UIImage imageWithData:imageData];
                    //NSLog(@"%@",imageData);
                }
                else{
//                    NSLog(@"%@",[saveError localizedDescription]);
                    self.errorLable.text=[saveError localizedDescription];
                }
            
                [self.activityAnimator stopAnimating];
            });
        }
        
    });
#else
    //Download image with NSSession.
    // Start the activity indicator before starting the download task.
    [self.activityAnimator startAnimating];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // Use a session with a custom configuration
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    // Create the image URL from some known string.
    NSURL *imageURL=[NSURL URLWithString:self.urlTextBox.text];
    // Create the download task passing in the URL of the image.
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:imageURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        // Get information about the response if neccessary.
        if (error) {
            NSLog(@"%@",[error localizedDescription]);
            // Something went wrong downloading the image. Figure out what went wrong and handle the error.
            // Don't forget to return to the main thread if you plan on doing UI updates here as well.
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activityAnimator stopAnimating];
            });
        } else {
            NSError *openDataError = nil;
            NSData *downloadedData = [NSData dataWithContentsOfURL:location
                                                           options:kNilOptions
                                                             error:&openDataError];
            if (openDataError) {
                // Something went wrong opening the downloaded data. Figure out what went wrong and handle the error.
                // Don't forget to return to the main thread if you plan on doing UI updates here as well.
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"%@",[openDataError localizedDescription]);
                    [self.activityAnimator stopAnimating];
                });
            } else {
                // Get the path of the application's documents directory.
                NSURL *documentsDirectoryURL = [self documentsDirectoryURL];
                // Append the desired file name to the documents directory path.
                NSURL *saveLocation = [documentsDirectoryURL URLByAppendingPathComponent:@"IMG.jpg"];
                NSError *saveError = nil;
                
                BOOL writeWasSuccessful = [downloadedData writeToURL:saveLocation
                                                             options:kNilOptions
                                                               error:&saveError];
                // Successful or not we need to stop the activity indicator, so switch back the the main thread.
                dispatch_async(dispatch_get_main_queue(), ^{
                    // Now that we're back on the main thread, you can make changes to the UI.
                    // This is where you might display the saved image in some image view, or
                    // stop the activity indicator.
                    
                    // Check if saving the file was successful, once again, utilizing the error parameter.
                    if (writeWasSuccessful) {
                        // Get the saved image data from the file.
                        NSData *imageData = [NSData dataWithContentsOfURL:saveLocation];
                        // Set the imageView's image to the image we just saved.
                        //self.ImageDisplay.image = [UIImage imageWithData:imageData];
                        NSLog(@"%@",imageData);

                    } else {
                        NSLog(@"%@",[saveError localizedDescription]);
                        // Something went wrong saving the file. Figure out what went wrong and handle the error.
                    }
                    
                    [self.activityAnimator stopAnimating];
                });
            }
        }
    }];
    
    // Tell the download task to resume (start).
    [task resume];
#endif
    self.urlTextBox.text=@"";
}
@end
