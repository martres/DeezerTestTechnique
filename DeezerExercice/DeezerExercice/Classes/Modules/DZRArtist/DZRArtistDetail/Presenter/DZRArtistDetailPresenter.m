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

- (void) resultOneAlbumOf:(DZRArtist *)artist error:(NSString *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (error != nil) {
            [self showError:error];
            return;
        }
        if (artist.artistAlbum == nil) {
            [self showError:@"Impossible to get the album"];
        } else {
            [self.userInterface showResultsOfGetOneAlbum:artist];
        }
    });
}

- (void) showError:(NSString *)error {
    [self.userInterface showError:error];
}

- (void)stoppingSong:(DZRTrack *)track {
    [self.userInterface stoppingSong:track];
}

- (void)startingSong:(DZRTrack *)track {
    [self.userInterface startingSong:track];
}

- (void)errorPlaylingSong:(DZRTrack *)track {
    NSString *error = [NSString stringWithFormat:@"Impossible to play track : %@", track.titleEntity];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.userInterface showError:error];
    });
}

#pragma - DZRArtistDetailModuleDelegate

- (void)stopSong:(DZRTrack *)track {
    [self.detailInteractor stopSong:track];
}

- (void)launchSong:(DZRTrack *)track {
    [self.detailInteractor launchSong:track];
}

- (void)getTracksOf:(DZRArtist *)artist {
    [self.detailInteractor getTracksOf:artist];
}

- (void)getOneAlbumOf:(DZRArtist *)artist {
    [self.detailInteractor getOneAlbumOf:artist];
}

- (void)dismissViewDetail {
    [self stopSong:nil];
    [self.detailWireframe dismissArtistDetail];
}

@end
