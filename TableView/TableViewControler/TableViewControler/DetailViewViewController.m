//
//  DetailViewViewController.m
//  TableViewControler
//
//  Created by Developer on 18/08/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

#import "DetailViewViewController.h"

@interface DetailViewViewController ()

@end

@implementation DetailViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleForView.text=_detailTitle;
    self.navigationItem.title=_detailTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
