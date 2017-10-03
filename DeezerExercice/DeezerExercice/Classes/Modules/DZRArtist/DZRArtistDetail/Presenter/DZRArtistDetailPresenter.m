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
    if (error != nil) {
        [self showError:error];
        return;
    }
    if (artist.artistAlbum.trackList == nil) {
        [self showError:@"Impossible to get tracks of the album"];
    } else {
        [self.userInterface showResultsOfGetOneAlbum:artist];
    }

}

- (void) resultOneAlbumOf:(DZRArtist *)artist error:(NSString *)error {
    if (error != nil) {
        [self showError:error];
        return;
    }
    if (artist.artistAlbum == nil) {
        [self showError:@"Impossible to get the album"];
    } else {
        [self.userInterface showResultsOfGetOneAlbum:artist];
    }
}

- (void) showError:(NSString *)error {
    [self.userInterface showError:error];
}

#pragma - DZRArtistDetailModuleDelegate

- (void)stopSong:(DZRTrack *)track {
    
}

- (void)launchSong:(DZRTrack *)track {
    
}

- (void)getTracksOf:(DZRArtist *)artist {
    [self.detailInteractor getTracksOf:artist];
}

- (void)getOneAlbumOf:(DZRArtist *)artist {
    [self.detailInteractor getOneAlbumOf:artist];
}

- (void)dismissViewDetail {
    [self.detailWireframe dismissArtistDetail];
}

@end
