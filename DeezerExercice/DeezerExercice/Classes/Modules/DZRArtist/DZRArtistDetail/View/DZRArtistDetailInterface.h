//
//  DZRArtistDetailInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/**
 @protocol DZRArtistDetailInterface
 @brief DZRArtistDetailInterface procotol
 @param showEmptyResultMessage: to handle if the request send no data
 @param reloadView: to reload the view
 @param showResultsOfSearchArtist: to ask to the presenter the data
 **/
#import "Modules.h"

@protocol DZRArtistDetailInterface <NSObject>

- (void)reloadView;
- (void)showError:(NSString *)error;
- (void)showResultsOfGetOneAlbum:(DZRArtist *)artist;
- (void)showResultsOfTrackOfAlbum:(DZRArtist *)artist;
- (void)startingSong:(DZRTrack *)track;
- (void)stoppingSong:(DZRTrack *)track;

@end
