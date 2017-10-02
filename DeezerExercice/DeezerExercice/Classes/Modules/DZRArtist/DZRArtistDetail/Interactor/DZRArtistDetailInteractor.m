//
//  DZRArtistDetailInteractor.m
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractor.h"

@implementation DZRArtistDetailInteractor

- (instancetype)initWithService:(ServiceManager *)serviceManager {
    self = [super initWithService:serviceManager];
    if (self) {
        self.serviceManager = serviceManager;
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

@end
