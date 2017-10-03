//
//  DZRArtistDetailInteractorInputOutput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

/*
 * @brief DZRArtistDetailInteractorInput
 * @discussion Protocol for the interactor called by the presenter
 */

@protocol DZRArtistDetailInteractorInput <NSObject>

/*
 * @brief getTracksOf
 * @params DZRArtist artist to know the current id of an album
 * @discussion Get tracks of an album
 */

- (void)getTracksOf:(DZRArtist *)artist;

/*
 * @brief getOneAlbumOf
 * @params DZRArtist artist to know the current id and send back the artist to set the album of artist
 * @discussion Get one album of an artist
 */

- (void)getOneAlbumOf:(DZRArtist *)artist;

/*
 * @brief launchSong
 * @params DZRTrack to know the current track
 * @discussion if the song if readable and mediaURL start song
 *             else stop song and call erroPlaylistSong
 */


- (void)launchSong:(DZRTrack *)track;

/*
 * @brief stopSong
 * @params DZRTrack to know the current track
 * @discussion stop the song
 */

- (void)stopSong:(DZRTrack *)track;

@end

/*
 * @brief DZRArtistDetailInteractorInput
 * @discussion Protocol for the presenter called by the interactor
 */

@protocol DZRArtistDetailInteractorOutput <NSObject>

/*
 * @brief resultTracksOf
 * @params DZRArtist artist with the album and the array of tracks
 * @params error string if the request failed
 * @discussion get the results of get tracks for an albumm and call the right function of user interface
 */

- (void)resultTracksOf:(DZRArtist *)artist error:(NSString *)error;

/*
 * @brief resultOneAlbumOf
 * @params DZRArtist artist with the album
 * @params error string if the request failed
 * @discussion get the results of get album and call the right function of user interface
 */

- (void)resultOneAlbumOf:(DZRArtist *)artist error:(NSString *)error;

/*
 * @brief startingSong
 * @params DZRTrack correspind track to play
 * @discussion starting to play a DZRTrack
 */

- (void)startingSong:(DZRTrack *)track;

/*
 * @brief stoppingSong
 * @params DZRTrack correspind track to play
 * @discussion stopping to play a DZRTrack
 */

- (void)stoppingSong:(DZRTrack *)track;

/*
 * @brief errorPlaylingSong
 * @params DZRTrack correspind track to play
 * @discussion function called if the DZRTrack is not playlable or the url is nil
 */

- (void)errorPlaylingSong:(DZRTrack *)track;

@end
