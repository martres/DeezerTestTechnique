//
//  DZRArtistCollectionViewCell.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistCollectionViewCell.h"
#import "UIImageView+LoadImage.h"

@implementation DZRArtistCollectionViewCell

+ (NSString *)getIdentifier {
    return @"DZRArtistCollectionViewCell";
}

+ (UINib *)getNibOfCell {
    return [UINib nibWithNibName:[DZRArtistCollectionViewCell getIdentifier] bundle:nil];
}

-(void)loadImageArtist:(NSString *)url indexPath:(NSIndexPath *)indexPath completion:(void (^)(UIImage *, NSIndexPath *))completion {
    [self.artistImage loadImage:url defaultImage:@"artist_default_image" completion:^(UIImage *image) {
        completion(image, indexPath);
    }];
}

@end
