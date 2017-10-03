//
//  PlayerManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Entities.h"
#import <AVFoundation/AVFoundation.h>

/*
 * @brief PlayerManager
 * @discussion Singleton to play a song
 */

@interface PlayerManager : NSObject

// player = current player of the playing song
@property (nonatomic, strong) AVPlayer          *player;

@property (nonatomic, strong) DZRTrack          *currentTrack;

+ (id)sharedInstance;

/*
 * @brief launchSong
 * @params track : DZRTrack need to be play
 * @discussion Start a song
 */

- (void)launchSong:(DZRTrack *)track;

/*
 * @brief stopSong
 * @discussion Pause the current song
 */

- (void)stopSong;

/*
 * @brief descriptionOfCurrentTrack
 * @return NSString description of the current track
 */

- (NSString *)descriptionOfCurrentTrack;

@end
