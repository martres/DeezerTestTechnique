//
//  DZRArtistCollectionViewCell.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistCollectionViewCell.h"
#import "UIView+round.h"
#import "UIImageView+LoadImage.h"

@implementation DZRArtistCollectionViewCell

+ (NSString *)getIdentifier {
    return @"DZRArtistCollectionViewCell";
}

+ (UINib *)getNibOfCell {
    return [UINib nibWithNibName:[DZRArtistCollectionViewCell getIdentifier] bundle:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.artistImage roundedWithColor:[UIColor whiteColor] borderSize:1 radius:self.artistImage.frame.size.width / 2];
}

- (void)loadImageArtist:(NSString *)url {
    [self.artistImage loadImage:url defaultImage:@"artist_default_image"];
}

@end
