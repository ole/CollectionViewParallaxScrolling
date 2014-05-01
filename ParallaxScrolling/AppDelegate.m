//
//  AppDelegate.m
//  ParallaxScrolling
//
//  Created by Ole Begemann on 01.05.14.
//  Copyright (c) 2014 Ole Begemann. All rights reserved.
//

#import "AppDelegate.h"
#import "PhotosCollectionViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    PhotosCollectionViewController *viewController = [[PhotosCollectionViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor whiteColor] }];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
