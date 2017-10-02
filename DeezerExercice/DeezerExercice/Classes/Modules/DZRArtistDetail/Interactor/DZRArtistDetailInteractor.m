//
//  DZRArtistDetailInteractor.m
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractor.h"

@interface DZRArtistDetailInteractor()

@property (nonatomic, strong) DZRAlbumService *albumService;
@property (nonatomic, strong) DZRTrackService *trackService;

@end

@implementation DZRArtistDetailInteractor

- (instancetype)initWithService:(DZRAlbumService *)serviceAlbum serviceTrack:(DZRTrackService *)serviceTrack {
    self = [super init];
    if (self) {
        self.albumService = serviceAlbum;
        self.trackService = serviceTrack;
    }
    return self;
}

#pragma - DZRArtistDetailInteractorInput

-(void)getOneAlbumAndTracks:(DZRArtist *)artist {
    __weak typeof(self) weak = self;
    [self.albumService getOneAlbum:artist.identifierEntity completion:^(DZRAlbum *album, NSString *error) {
        if (error != nil) {
            [weak.output resultAlbumAndTracks:artist error:error];
            return;
        }
        [weak.trackService getTracksFromAlbum:album.identifierEntity completion:^(DZRTrackArray *tracks, NSString *error) {
            artist.artistAlbum = album;
            artist.artistAlbum.trackList = tracks;
            [weak.output resultAlbumAndTracks:artist error:error];
        }];
    }];
}

@end
