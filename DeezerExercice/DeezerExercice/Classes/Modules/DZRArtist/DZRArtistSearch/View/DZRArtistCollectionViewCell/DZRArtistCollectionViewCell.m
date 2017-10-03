//
//  DZRArtistCollectionViewCell.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistCollectionViewCell.h"

@implementation DZRArtistCollectionViewCell

+ (NSString *)getIdentifier {
    return @"DZRArtistCollectionViewCell";
}

+ (UINib *)getNibOfCell {
    return [UINib nibWithNibName:[DZRArtistCollectionViewCell getIdentifier] bundle:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.artistImage rounded:self.artistImage.frame.size.width / 2];
}

@end
