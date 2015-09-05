//
//  ViewController.h
//  DownloadDisplayImage
//
//  Created by Developer on 19/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImageDisplay;
@property (weak, nonatomic) IBOutlet UILabel *errorLable;
@property (weak, nonatomic) IBOutlet UITextField *urlTextBox;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityAnimator;

-(IBAction)retrieveImage:(id)sender;
-(NSURL*)documentsDirectoryURL;

@end

