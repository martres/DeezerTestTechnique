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

- (instancetype)initWithService:(ServiceManager *)serviceManager playerManager:(PlayerManager *)playerManager {
    self = [super initWithService:serviceManager];
    if (self) {
        self.serviceManager = serviceManager;
        self.playerManager = playerManager;
    }
    return self;
}

#pragma - DZRArtistDetailInteractorInput

-(void)getOneAlbumOf:(DZRArtist *)artist {
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:ALBUM nameService:GET_ONE_ALBUM data:artist.identifierEntity completion:^(DZRAlbum *album, NSString *error) {
        artist.artistAlbum = album;
        [weak.output resultOneAlbumOf:artist error:error];
    }];
}

-(void)getTracksOf:(DZRArtist *)artist{
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:TRACK nameService:GET_TRACKS_OF_ALBUM data:artist.artistAlbum.identifierEntity completion:^(DZRTrackArray *tracks, NSString *error) {
        artist.artistAlbum.trackList = tracks;
        [weak.output resultTracksOf:artist error:error];
    }];
}

-(void)stopSong:(DZRTrack *)track {
    [self.playerManager stopSong];
    [self.output stoppingSong:track];
}

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
