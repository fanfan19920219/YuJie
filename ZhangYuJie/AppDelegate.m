//
//  AppDelegate.m
//  ZhangYuJie
//
//  Created by Star J on 2018/2/20.
//  Copyright © 2018年 Star J. All rights reserved.
//

#import "AppDelegate.h"
#import "Header.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    
    MainPageViewController *mainnav = [[MainPageViewController alloc]init];
    
    UINavigationController *main = [[UINavigationController alloc]initWithRootViewController:mainnav];
    main.tabBarItem.image=[[UIImage imageNamed:@"tabBar_home_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    main.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabBar_home_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [main.tabBarItem setImageInsets:UIEdgeInsetsMake(10, 0, -10, 0)];
    
    
    
    selfViewController *personal = [[selfViewController alloc]init];
    personal.tabBarItem.image=[[UIImage imageNamed:@"tabBar_myJD_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    personal.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabBar_myJD_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [personal.tabBarItem setImageInsets:UIEdgeInsetsMake(10, 0, -10, 0)];
    
    
    
    NSArray *tabarr = [[NSArray alloc]initWithObjects:main,personal,nil];
    
    UITabBarController *tabar = [[UITabBarController alloc]init];
    tabar.viewControllers = tabarr;
    tabar.tabBar.barTintColor=  RGBA(88, 80, 84, 0.6);
    
    self.window.rootViewController = tabar;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
