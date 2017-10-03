//
//  UIView+round.m
//  DeezerExercice
//
//  Created by Martreux Steven on 01/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Utils.h"

@implementation UIView (round)

/*
 * @brief rounded
 * @params radius : radius of the border
 * @discussion round a view
 */

- (void)rounded:(CGFloat)radius {
    self.clipsToBounds = true;
    self.layer.cornerRadius = radius;
}

/*
 * @brief roundedWithColor
 * @params color : color of the border
 * @params borderSize : size of the border
 * @params radius : radius of the border
 * @discussion round a view with color and borderSize
 */

- (void)roundedWithColor:(UIColor *)color borderSize:(CGFloat)borderSize radius:(CGFloat)radius {
    self.clipsToBounds = true;
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:borderSize];
    [self.layer setCornerRadius:radius];
}

@end
