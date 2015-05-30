//
//  AppDelegate.m
//  ZKExperiments
//
//  Created by Zeeshan Khan on 29/05/15.
//  Copyright (c) 2015 Zeeshan Khan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *navCont = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navCont;
    
    // View Controller: http://stackoverflow.com/questions/17678881/how-to-change-status-bar-text-color-in-ios-7?page=1&tab=votes#tab-top
    // Navigation Controller: http://stackoverflow.com/questions/19022210/preferredstatusbarstyle-isnt-called/19513714#19513714
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
