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

// Current index of the tableView
@property (nonatomic, assign) NSInteger index;

// eventPlayer protocol to handle the action on the playButton
@property (nonatomic, weak) id<DZRArtistTrackProtocol> eventPlayer;

// Static function to get identifier of the Cell
+(NSString *)getIdentifier;

// Static function to get nib of the cell
+(UINib *)getNib;

@end
