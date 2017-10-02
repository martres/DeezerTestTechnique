//
//  DZRArtistDetailModuleInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

@protocol DZRArtistDetailModuleInterface <NSObject

- (void)getOneAlbumeAndTracks:(DZRArtist *)artist;

- (void)launchSong:(DZTrack *)track;

@end
