//
//  DZRArtistTrackTableViewCell.m
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"
#import "DZRArtistTrackTableViewCell.h"

@implementation DZRArtistTrackTableViewCell

+ (NSString *)getIdentifier {
    return @"DZRArtistTrackTableViewCell";
}

+ (UINib *)getNib {
    return [UINib nibWithNibName:[self getIdentifier] bundle:[NSBundle mainBundle]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.container rounded:6];
}

- (IBAction)playSongAction:(UIButton *)sender {
    if (sender.isSelected) {
        [self.eventPlayer stopSongAtIndex:self.index];
    } else {
        [self.eventPlayer startSongAtIndex:self.index];
    }
}

@end
