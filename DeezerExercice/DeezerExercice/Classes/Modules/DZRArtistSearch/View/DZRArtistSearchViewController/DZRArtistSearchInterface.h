//
//  DZRArtistSearchInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistArray.h"

/**
 @protocol DZRArtistSearchInterface
 @brief DRZArtistInterface procotol
 @param showEmptyResultMessage: to handle if the request send no data
 @param reloadView: to reload the view
 @param showResultsOfSearchArtist: to ask to the presenter the data
 **/

@protocol DZRArtistSearchInterface <NSObject>

- (void)showEmptyResultMessage;
- (void)showError:(NSString *)error;
- (void)reloadView;
- (void)showResultsOfSearchArtist:(DZRArtistArray *)artists;

@end
