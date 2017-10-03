//
//  UIViewController+getIdentifier.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief UIViewController extension
 */

@interface UIViewController (Extension)

/*
 * @brief identifierStoryboard
 * @discussion get the current identifier of the view controller from storyboard
 * Cast the name of class
 */

+ (NSString *)identifierStoryboard;

@end
