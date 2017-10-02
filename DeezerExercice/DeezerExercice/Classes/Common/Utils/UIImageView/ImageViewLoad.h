//
//  ImageViewLoad.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

static NSCache *cacheImage;

@interface ImageViewLoad : UIImageView

@property (nonatomic, strong) NSString *imageUrlString;

- (void)loadImage:(NSString *)imageUrlString defaultImage:(NSString *)defaultImage;

@end
