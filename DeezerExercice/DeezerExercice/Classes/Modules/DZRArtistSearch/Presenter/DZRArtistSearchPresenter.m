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

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error {
    [self execResults:artistArray error:error isSearch:true];
}

- (void)resultMoreArtist:(DZRArtistArray *)artistArray error:(NSString *)error {
    [self execResults:artistArray error:error isSearch:false];
    self.isStartingRequest = false;
}

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

- (void)showMoreArtists:(DZRArtistArray *)artistarray {    
    if (!self.isStartingRequest) {
        [self.artistSearchInteractor showMoreArtistWith:artistarray];
    }
    self.isStartingRequest = true;
}

- (void)searchArtistWithName:(NSString *)textSearch {
    [self.artistSearchInteractor searchArtistWithName:textSearch];
}

- (void)showDetailOfArtist:(DZRArtist *)artist {
    [self.artistSearchWireframe presentArtistDetail:artist];
}

@end
