//
//  UIView+round.h
//  DeezerExercice
//
//  Created by Martreux Steven on 01/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief UIView round
 * @discussion Extension to round the view
 */

@interface UIView (round)

/*
 * @brief roundedWithColor
 * @params color : color of the border
 * @params borderSize : size of the border
 * @params radius : radius of the border
 * @discussion round a view with color and borderSize
 */

- (void)roundedWithColor:(UIColor *)color borderSize:(CGFloat)borderSize radius:(CGFloat)radius;

/*
 * @brief rounded
 * @params radius : radius of the border
 * @discussion round a view
 */

- (void)rounded:(CGFloat)radius;

@end
