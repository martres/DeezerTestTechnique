//
//  UIView+round.m
//  DeezerExercice
//
//  Created by Martreux Steven on 01/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "UIView+round.h"

@implementation UIView (round)

- (void)rounded:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = true;
}

- (void)roundedWithColor:(UIColor *)color borderSize:(CGFloat)borderSize radius:(CGFloat)radius {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderSize;
    self.layer.cornerRadius = radius;
    self.clipsToBounds = true:
}

@end
