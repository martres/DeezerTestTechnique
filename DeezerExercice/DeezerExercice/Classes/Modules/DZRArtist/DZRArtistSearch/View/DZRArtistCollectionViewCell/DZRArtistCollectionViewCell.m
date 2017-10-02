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

@end
