//
//  UIView+round.m
//  DeezerExercice
//
//  Created by Martreux Steven on 01/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "UIView+round.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (round)

- (void)rounded:(CGFloat)radius {
    self.clipsToBounds = true;
    self.layer.cornerRadius = radius;
}

- (void)roundedWithColor:(UIColor *)color borderSize:(CGFloat)borderSize radius:(CGFloat)radius {
    self.clipsToBounds = true;
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:borderSize];
    [self.layer setCornerRadius:radius];
}

@end
