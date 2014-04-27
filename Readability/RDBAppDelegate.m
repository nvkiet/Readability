//
//  RDBAppDelegate.m
//  Readability
//
//  Created by KIET NGUYEN on 4/23/14.
//  Copyright (c) 2014 Kiet Nguyen. All rights reserved.
//

#import "RDBAppDelegate.h"
#import "RDBReadingListViewController.h"

@interface RDBAppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;
@end

@implementation RDBAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Center view controller
    RDBReadingListViewController *readingListVC = [[RDBReadingListViewController alloc] initWithNibName:NSStringFromClass([RDBReadingListViewController class]) bundle:nil];
    UINavigationController *centerNavController = [[UINavigationController alloc] initWithRootViewController:readingListVC];
    
    // Left view controller
    UIViewController * leftSideDrawerViewController = [[RDBLeftSideDrawerViewController alloc] init];
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerNavController leftDrawerViewController:leftSideDrawerViewController rightDrawerViewController:nil];
    [self.drawerController setShowsShadow:NO];
    
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window setRootViewController: self.drawerController];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupApperances];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

/* Custom default setting */
- (void)setupApperances
{
    [[UIBarButtonItem appearance] setTintColor:[UIColor redColor]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
