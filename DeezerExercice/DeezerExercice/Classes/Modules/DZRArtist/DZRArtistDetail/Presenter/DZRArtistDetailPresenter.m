//
//  DZRArtistDetailPresenter.m
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailPresenter.h"

@implementation DZRArtistDetailPresenter

#pragma - DZRArtistDetailInteractorOutput

/*
 * @brief resultTracksOf
 * @params DZRArtist artist with the album and the array of tracks
 * @params error string if the request failed
 * @discussion get the results of get tracks for an albumm and call the right function of user interface
 */

- (void) resultTracksOf:(DZRArtist *)artist error:(NSString *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (error != nil) {
            [self showError:error];
            return;
        }
        if (artist.artistAlbum.trackList == nil) {
            [self showError:@"Impossible to get tracks of the album"];
        } else {
            [self.userInterface showResultsOfTrackOfAlbum:artist];
        }
    });
}

/*
 * @brief resultOneAlbumOf
 * @params DZRArtist artist with the album
 * @params error string if the request failed
 * @discussion get the results of get album and call the right function of user interface
 */

- (void) resultOneAlbumOf:(DZRArtist *)artist error:(NSString *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (error != nil) {
            [self showError:error];
            [self dismissViewDetail];
            return;
        }
        if (artist.artistAlbum == nil) {
            [self showError:@"Impossible to get the album"];
            [self dismissViewDetail];
        } else {
            [self.userInterface showResultsOfGetOneAlbum:artist];
        }
    });
}

/*
 * @brief showError
 * @params error string if the request failed
 * @discussion call the user interface to show the error
 */

- (void) showError:(NSString *)error {
    [self.userInterface showError:error];
}

/*
 * @brief stoppingSong
 * @params DZRTrack correspind track to play
 * @discussion stopping to play a DZRTrack
 */

- (void)stoppingSong:(DZRTrack *)track {
    [self.userInterface stoppingSong:track];
}

/*
 * @brief startingSong
 * @params DZRTrack correspind track to play
 * @discussion starting to play a DZRTrack
 */

- (void)startingSong:(DZRTrack *)track {
    [self.userInterface startingSong:track];
}

/*
 * @brief errorPlaylingSong
 * @params DZRTrack correspind track to play
 * @discussion function called if the DZRTrack is not playlable or the url is nil
 */

- (void)errorPlaylingSong:(DZRTrack *)track {
    NSString *error = [NSString stringWithFormat:@"Impossible to play track : %@", track.titleEntity];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.userInterface showError:error];
    });
}

#pragma - DZRArtistDetailModuleDelegate

/*
 * @brief stopSong
 * @params DZRTrack track to stop
 */

- (void)stopSong:(DZRTrack *)track {
    [self.detailInteractor stopSong:track];
}

/*
 * @brief launchSong
 * @params DZRTrack track to start
 */

- (void)launchSong:(DZRTrack *)track {
    [self.detailInteractor launchSong:track];
}

/*
 * @brief getTracksOf
 * @params DZArtist artist corresponding to the album and the tracks
 */

- (void)getTracksOf:(DZRArtist *)artist {
    [self.detailInteractor getTracksOf:artist];
}

/*
 * @brief getOneAlbumOf
 * @params DZArtist artist corresponding to the album
 */

- (void)getOneAlbumOf:(DZRArtist *)artist {
    [self.detailInteractor getOneAlbumOf:artist];
}

/*
 * @brief dismissViewDetail
 * calling to dismiss the current view controller
 */

- (void)dismissViewDetail {
    [self stopSong:nil];
    [self.detailWireframe dismissArtistDetail];
}

@end
