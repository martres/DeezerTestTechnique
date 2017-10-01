//
//  DZRArtistCollectionViewCell.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistCollectionViewCell.h"
#import "UIView+round.h"

@implementation DZRArtistCollectionViewCell

+ (NSString *)identifierCell {
    return @"DZRArtistCollectionViewCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.artistImage roundedWithColor:[UIColor lightGrayColor] borderSize:1 radius:self.artistImage.frame.size.width /2]:
}

@end
