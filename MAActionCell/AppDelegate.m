//
//  AppDelegate.m
//  MAActionCell
//
//  Created by Mike on 8/4/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"

@interface AppDelegate ()
            

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    DemoViewController *demoVC = [DemoViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:demoVC];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
