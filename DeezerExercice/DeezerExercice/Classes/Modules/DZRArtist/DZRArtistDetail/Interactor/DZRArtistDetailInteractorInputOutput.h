//
//  DZRArtistDetailInteractorInputOutput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

@protocol DZRArtistDetailInteractorInput <NSObject>

- (void)getTracksOf:(DZRArtist *)artist;

- (void)getOneAlbumOf:(DZRArtist *)artist;

- (void)launchSong:(DZRTrack *)track;

- (void)stopSong:(DZRTrack *)track;

@end

@protocol DZRArtistDetailInteractorOutput <NSObject>

- (void)resultTracksOf:(DZRArtist *)artist error:(NSString *)error;

- (void)resultOneAlbumOf:(DZRArtist *)artist error:(NSString *)error;

- (void)startingSong:(DZRTrack *)track;

- (void)stoppingSong:(DZRTrack *)track;

- (void)errorPlaylingSong:(DZRTrack *)track;

@end
