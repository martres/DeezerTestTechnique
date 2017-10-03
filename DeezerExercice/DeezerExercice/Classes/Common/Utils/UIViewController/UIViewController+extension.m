//
//  UIViewController+getIdentifier.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Utils.h"

@implementation UIViewController (Extension)

/*
 * @brief identifierStoryboard
 * @discussion get the current identifier of the view controller from storyboard
 * Cast the name of class
 */

+ (NSString *)identifierStoryboard {
    NSString *nameClass = [NSString stringWithFormat:@"%@", [self class]];
    return nameClass;
}

@end
