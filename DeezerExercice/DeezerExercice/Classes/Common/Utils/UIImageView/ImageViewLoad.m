//
//  ImageViewLoad.m
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "ImageViewLoad.h"
#import "APIManager.h"

@implementation ImageViewLoad

- (void)loadImage:(NSString *)imageUrlString defaultImage:(NSString *)defaultImage {
    self.imageUrlString = imageUrlString;
    
    self.image = [UIImage imageNamed:defaultImage];
    UIImage *imageFromCache = [cacheImage objectForKey:imageUrlString];
    if (imageFromCache != nil) {
        self.image = imageFromCache;
        return;
    }
    
    [APIManager.sharedInstance get:imageUrlString completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            NSLog(@"ERROR DOWNLOAD IMAGE : %@ %@", imageUrlString, error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *imageToCache = [UIImage imageWithData:data];
            if (self.imageUrlString == imageUrlString) {
                self.image = imageToCache;
            }
            [cacheImage setObject:imageToCache forKey:imageUrlString];
        });
    }];
}

@end
