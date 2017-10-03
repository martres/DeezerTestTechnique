//
//  PlayerManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Entities.h"
#import <AVFoundation/AVFoundation.h>

@interface PlayerManager : NSObject

@property (nonatomic, strong) AVPlayer          *player;
@property (nonatomic, strong) DZRTrack          *currentTrack;

+ (id)sharedInstance;

- (void)launchSong:(DZRTrack *)track;
- (void)stopSong;

- (NSString *)descriptionOfCurrentTrack;

@end
