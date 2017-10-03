//
//  DZRArtistTrackTableViewCell.h
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistTrackProtocol.h"

@interface DZRArtistTrackTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel    *numberTrack;
@property (nonatomic, weak) IBOutlet UILabel    *nameTrack;
@property (nonatomic, weak) IBOutlet UIButton   *playButton;
@property (nonatomic, weak) IBOutlet UIView     *container;

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) id<DZRArtistTrackProtocol> eventPlayer;

+(NSString *)getIdentifier;
+(UINib *)getNib;

@end
