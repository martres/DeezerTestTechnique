//
//  DZRArtistSearchInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @protocol DZRArtistSearchInterface
 @brief DRZArtistInterface procotol
 @param showEmptyResultMessage: to handle if the request send no data
 @param reloadView: to reload the view
 @param showResultsOfSearchArtist: to handle if the request send data with results
 **/

@protocol DZRArtistSearchInterface <NSObject>

- (void)showEmptyResultMessage;
- (void)reloadView;
- (void)showResultsOfSearchArtist;

@end
