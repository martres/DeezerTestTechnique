//
//  UIImageView+LoadImage.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "UIImageView+LoadImage.h"

@implementation UIImageView (LoadImage)

- (void)loadImage:(NSString *)url defaultImage:(NSString *)defaultImage {
    self.image = [UIImage imageNamed:defaultImage];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^(void) {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage* image = [[UIImage alloc] initWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self duration:0.8 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.image = image;
            } completion:nil];
        });
    });
}

@end
