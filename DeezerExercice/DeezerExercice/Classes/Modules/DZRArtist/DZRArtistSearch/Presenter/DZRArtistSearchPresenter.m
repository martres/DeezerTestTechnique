//
//  DZArtistSearchPresenter.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchPresenter.h"

@interface DZRArtistSearchPresenter()

@property (nonatomic, assign) BOOL isStartingRequest;

@end

@implementation DZRArtistSearchPresenter

#pragma DZRArtistSearchInteractorOutput delegate

/*
 * @brief resultSearchArtistWithName
 * @params DZRArtistArray array of artists result of the request search
 * @params error string if the request failed
 * @discussion get the results of artists search
 */

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error {
    [self execResults:artistArray error:error isSearch:true];
}

/*
 * @brief resultMoreArtist
 * @params DZRArtistArray array of all artists with the same search
 * @params error string if the request failed
 * @discussion get the results of more artist
 */

- (void)resultMoreArtist:(DZRArtistArray *)artistArray error:(NSString *)error {
    [self execResults:artistArray error:error isSearch:false];
    self.isStartingRequest = false;
}

/*
 * @brief execResults
 * @params DZRArtistArray array of all artists
 * @params error string if the request failed
 * @params isSearch to handle 2 kind of action for the user interface
 */

- (void)execResults:(DZRArtistArray *)artistArray error:(NSString *)error isSearch:(BOOL)isSearch {
    if (error != nil) {
        [self showError:error];
    } else {
        if (artistArray.arrayItems.count != 0) {
            if (isSearch) {
                [self showResultsSearch:artistArray];
            } else {
                [self.userInterface insertArtists:artistArray];
            }
        } else {
            if (isSearch) {
                [self showNoContent];
            }
        }
    }
}

/*
 * @brief showResultsSearch
 * @params DZRArtistArray array of all artists
 * @discussion call function of the user interface to show the result of artistArray from request
 */

- (void)showResultsSearch:(DZRArtistArray *)artistArray {
    [self.userInterface showResultsOfSearchArtist:artistArray];
    [self.userInterface reloadView];
    [self.userInterface showTopOfScroll];
}

- (void)showNoContent {
    [self.userInterface showEmptyResultMessage];
}

- (void)showError:(NSString *)error {
    [self.userInterface showError:error];
}

#pragma DZRArtistSearchModuleInterface delegate

/**
 @brief Show more Artist
 @param DZArtistArray
 **/

- (void)showMoreArtists:(DZRArtistArray *)artistarray {
    if (self.isStartingRequest || artistarray.nextURL == nil) {
        return;
    }
    
    [self.artistSearchInteractor showMoreArtistWith:artistarray];
    self.isStartingRequest = true;
}

/*
 * @brief searchArtistWithName
 * @params string of the search text
 * @discussion search artist and send the result to the presenter
 */

- (void)searchArtistWithName:(NSString *)textSearch {
    [self.artistSearchInteractor searchArtistWithName:textSearch];
}

/**
 @brief Show the detail of an artist
 @param an Artist (DZRArtist)
 **/

- (void)showDetailOfArtist:(DZRArtist *)artist {
    [self.artistSearchWireframe presentArtistDetail:artist];
}

@end
