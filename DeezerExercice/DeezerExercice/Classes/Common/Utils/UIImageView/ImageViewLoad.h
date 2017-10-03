//
//  ImageViewLoad.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

static NSCache *cacheImage;

/*
 * @brief ImageViewLoad
 * @discussion Extension UIImageView to load an image
 */

@interface ImageViewLoad : UIImageView

//  current image url string
@property (nonatomic, strong) NSString *imageUrlString;

/*
 * @brief loadImage
 * @params imageUrlString : the url to load the image
 * @discussion load an image with an url string
 */

- (void)loadImage:(NSString *)imageUrlString;

@end
