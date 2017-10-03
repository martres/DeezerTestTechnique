//
//  DZRArtistDetailInteractor.m
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractor.h"

@interface DZRArtistDetailInteractor()

@property (nonatomic, strong) PlayerManager *playerManager;

@end

@implementation DZRArtistDetailInteractor

/*
 * @brief initWithService
 * @params serviceManager manager to handle request from service
 * @params playerManager manager to handle to play song from DZRTrack
 * @discussion instancetype of DZRArtistDetailInteractor
 */

- (instancetype)initWithService:(ServiceManager *)serviceManager playerManager:(PlayerManager *)playerManager {
    self = [super initWithService:serviceManager];
    if (self) {
        self.playerManager = playerManager;
    }
    return self;
}

#pragma - DZRArtistDetailInteractorInput

/*
 * @brief getOneAlbumOf
 * @params DZRArtist artist to know the current id and send back the artist to set the album of artist
 * @discussion Get one album of an artist
 */

-(void)getOneAlbumOf:(DZRArtist *)artist {
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:ALBUM nameService:GET_ONE_ALBUM data:artist.identifierEntity completion:^(DZRAlbum *album, NSString *error) {
        artist.artistAlbum = album;
        [weak.output resultOneAlbumOf:artist error:error];
    }];
}

/*
 * @brief getTracksOf
 * @params DZRArtist artist to know the current id of an album
 * @discussion Get tracks of an album
 */

-(void)getTracksOf:(DZRArtist *)artist{
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:TRACK nameService:GET_TRACKS_OF_ALBUM data:artist.artistAlbum.identifierEntity completion:^(DZRTrackArray *tracks, NSString *error) {
        artist.artistAlbum.trackList = tracks;
        [weak.output resultTracksOf:artist error:error];
    }];
}

/*
 * @brief stopSong
 * @params DZRTrack to know the current track
 * @discussion stop the song
 */

-(void)stopSong:(DZRTrack *)track {
    [self.playerManager stopSong];
    [self.output stoppingSong:track];
}

/*
 * @brief launchSong
 * @params DZRTrack to know the current track
 * @discussion if the song if readable and mediaURL start song
 *             else stop song and call erroPlaylistSong
 */


-(void)launchSong:(DZRTrack *)track {
    if (track.isReadable && track.mediaUrl != nil) {
        [self.playerManager launchSong:track];
        [self.output startingSong:track];
    } else {
        [self.playerManager stopSong];
        [self.output errorPlaylingSong:track];
    }
}

@end
