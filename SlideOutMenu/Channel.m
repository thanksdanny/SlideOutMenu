//
//  Channel.m
//  SlideOutMenu
//
//  Created by Danny Ho on 3/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "Channel.h"
#import "SWRevealViewController.h"

@interface Channel ()

@end

@implementation Channel

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealController = self.revealViewController;
    [revealController panGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon"]
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:revealController
                                                                        action:@selector(revealToggle:)];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon"]
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:revealController
                                                                       action:@selector(rightRevealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
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
