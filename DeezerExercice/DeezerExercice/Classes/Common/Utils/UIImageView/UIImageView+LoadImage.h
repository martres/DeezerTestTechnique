//
//  UIImageView+LoadImage.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

typedef void(^ImageLoader)(UIImage *image);

@interface UIImageView (LoadImage)

- (void)loadImage:(NSString *)url defaultImage:(NSString *)defaultImage completion:(ImageLoader)completion;

@end

