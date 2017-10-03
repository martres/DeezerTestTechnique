//
//  DZRAlbum.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseEntity.h"
#import "DZRTrackArray.h"

/*
 * @brief DZRAlbum
 * @discussion Entity to handle an album of Deezer with a reference of tracks
 */

@interface DZRAlbum : BaseEntity

//  trackList = reference of an array of track
@property (nonatomic, strong) DZRTrackArray *trackList;

@end
