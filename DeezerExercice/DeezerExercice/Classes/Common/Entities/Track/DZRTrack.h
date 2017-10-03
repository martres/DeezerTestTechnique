//
//  DZRTrack.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseEntity.h"

/*
 * @brief DZRTrack
 * @discussion Entity to handle a track of deezer
 */

@interface DZRTrack : BaseEntity

//  isReadable = boolean to know if the track is playlable
@property (nonatomic, assign) BOOL isReadable;

//  mediaUrl = string url of track preview
@property (nonatomic, strong) NSString *mediaUrl;

@end
