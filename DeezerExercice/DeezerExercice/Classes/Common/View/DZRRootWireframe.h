//
//  DZRootWireframe.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief DZRRootWireframe
 * @discussion RootWireframe to handle the main view and show
 */

@interface DZRRootWireframe : NSObject

/*
 * @brief showRootViewController
 * @params viewController : the view controller need to be set as rootviewcontroller
 * @params inWindow : the current window of the application
 * @discussion show the main root view controller
 */

- (void) showRootViewController:(UIViewController *)viewController  inWindow:(UIWindow *)window;

/*
 * @brief pushViewController
 * @params viewController : the view controller need to be show
 * @params animated : boolean if the view controller will be animated or not
 * @discussion push a view controller to the main navigation
 */

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
