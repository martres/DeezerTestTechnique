//
//  DZRootWireframe.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRRootWireframe.h"

@implementation DZRRootWireframe

/*
 * @brief showRootViewController
 * @params viewController : the view controller need to be set as rootviewcontroller
 * @params inWindow : the current window of the application
 * @discussion show the main root view controller
 */

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}

/*
 * @brief pushViewController
 * @params viewController : the view controller need to be show
 * @params animated : boolean if the view controller will be animated or not
 * @discussion push a view controller to the main navigation
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UINavigationController *navigationController = (UINavigationController *)[viewController navigationController];
    if (navigationController != nil) {
        [navigationController pushViewController:viewController animated:animated];
    }
}

/*
 * @brief navigationControllerFromWindow
 * @params inWindow : the current window of the application
 * @discussion get the main navigation controller
 * @return the navigation controller created
 */

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

@end
