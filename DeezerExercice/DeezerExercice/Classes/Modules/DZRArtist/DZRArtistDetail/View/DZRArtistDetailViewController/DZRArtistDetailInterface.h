//
//  DZRArtistDetailInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

/**
 @protocol DZRArtistDetailInterface
 @brief DZRArtistDetailInterface procotol
 function called by the view controller
 **/

@protocol DZRArtistDetailInterface <NSObject>

// showError if the request fail for example
- (void)showError:(NSString *)error;

// result of the request for one album of an artist
- (void)showResultsOfGetOneAlbum:(DZRArtist *)artist;

// result of the request for tracks of an album of an artist
- (void)showResultsOfTrackOfAlbum:(DZRArtist *)artist;

// song has been start
- (void)startingSong:(DZRTrack *)track;

// song has been stop
- (void)stoppingSong:(DZRTrack *)track;

@end
