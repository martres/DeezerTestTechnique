//
//  DZRArtistDetailModuleInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

@protocol DZRArtistDetailModuleInterface <NSObject>

-(void)getOneAlbumOf:(DZRArtist *)artist;

-(void)getTracksOf:(DZRArtist *)artist;

-(void)launchSong:(DZRTrack *)track;

-(void)stopSong:(DZRTrack *)track;

@end
