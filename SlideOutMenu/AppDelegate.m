//
//  AppDelegate.m
//  SlideOutMenu
//
//  Created by Danny Ho on 3/26/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "RightVC.h"     // right
#import "BackTableVC.h" // rear
#import "ReadLater.h"   // front
#import "Channel.h"     // two
#import "FriendRead.h"  // three

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    // 创建控制器
    BackTableVC *backTableVC = [[BackTableVC alloc] init];
    RightVC *rightVC = [[RightVC alloc] init];
    ReadLater *readLaterVC = [[ReadLater alloc] init];
    Channel *channelVC = [[Channel alloc] init];
    FriendRead *friendReadVC = [[FriendRead alloc] init];
    
    // 创建导航
    UINavigationController *frontNavigationVC = [[UINavigationController alloc] initWithRootViewController:readLaterVC];
    UINavigationController *rearNavigationVC = [[UINavigationController alloc] initWithRootViewController:backTableVC];
    
    // 创建SWRevealViewController作为容器
    SWRevealViewController *revealViewController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationVC frontViewController:frontNavigationVC];
    
    // 设置右控制器背景为green，然后添加进revealViewController容器中
    [rightVC.view setBackgroundColor:[UIColor greenColor]];
    revealViewController.rightViewController = rightVC;
    
    // 把revealViewController添加 成为跟控制器
    self.window.rootViewController = revealViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
