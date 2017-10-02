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

- (void)loadImageArtist:(NSString *)url {
    [self.artistImage loadImage:url defaultImage:@"artist_default_image"];
}

@end
