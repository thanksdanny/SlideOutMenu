//
//  ViewController.m
//  SlideOutMenu
//
//  Created by Danny Ho on 3/26/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = self.revealViewController;
//    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
//    [self.view addGestureRecognizer:[[self revealViewController] panGestureRecognizer]];
    NSLog(@"lol");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
