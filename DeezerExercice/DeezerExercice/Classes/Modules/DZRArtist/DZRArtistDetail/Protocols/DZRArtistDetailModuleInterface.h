//
//  DZRArtistDetailModuleInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

/*
 * @brief Protocol for the module
 */

@protocol DZRArtistDetailModuleInterface <NSObject>

/*
 * @brief getOneAlbumOf
 * @params DZArtist artist corresponding to the album
 */

-(void)getOneAlbumOf:(DZRArtist *)artist;

/*
 * @brief getTracksOf
 * @params DZArtist artist corresponding to the album and the tracks
 */

-(void)getTracksOf:(DZRArtist *)artist;

/*
 * @brief launchSong
 * @params DZRTrack track to start
 */

-(void)launchSong:(DZRTrack *)track;

/*
 * @brief stopSong
 * @params DZRTrack track to stop
 */

-(void)stopSong:(DZRTrack *)track;

/*
 * @brief dismissViewDetail
 * calling to dismiss the current view controller
 */

- (void)dismissViewDetail;

@end
