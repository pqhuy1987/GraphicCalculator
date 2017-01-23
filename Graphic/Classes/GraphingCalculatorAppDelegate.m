//
//  GraphingCalculatorAppDelegate.m
//  GraphingCalculator
//
//  Created by Ezra Spier on 1/1/11.
//  Copyright 2011 Ezra Spier. All rights reserved.
//

#import "GraphingCalculatorAppDelegate.h"

@implementation GraphingCalculatorAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	CalculatorViewController *calculatorViewController = [[CalculatorViewController alloc] init];
	GraphViewController *graphViewController = [[GraphViewController alloc] init];
	calculatorViewController.graphViewController = graphViewController;
	UINavigationController *calcNavigationController = [[UINavigationController alloc] init];
	[calcNavigationController pushViewController:calculatorViewController animated:NO];
    
	BOOL iPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
	if (iPad) {
		UINavigationController *graphNavigationController = [[UINavigationController alloc] init];
		[graphNavigationController pushViewController:graphViewController animated:NO];
		UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
		
		splitViewController.delegate = graphViewController;
		splitViewController.viewControllers	= [NSArray arrayWithObjects:calcNavigationController, graphNavigationController, nil];
		[graphNavigationController release];
		rootViewController = splitViewController;
	} else {
		rootViewController = calcNavigationController;
	}

	[calculatorViewController release];
	[graphViewController release];

//	[window addSubview:rootViewController.view];
    [window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[rootViewController release];
    [window release];
    [super dealloc];
}


@end
