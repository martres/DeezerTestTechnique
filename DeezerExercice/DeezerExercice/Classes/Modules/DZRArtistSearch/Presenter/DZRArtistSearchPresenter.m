//
//  DZArtistSearchPresenter.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchPresenter.h"

@implementation DZRArtistSearchPresenter

#pragma DZRArtistSearchInteractorOutput delegate

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error {
    if (error != nil) {
        [self showError:error];
    } else {
        if (artistArray.arrayItems.count == 0) {
            [self showNoContent];
        } else {
            [self showResultsSearch:artistArray];
        }
    }
}

- (void)showResultsSearch:(DZRArtistArray *)artistArray {
    [self.userInterface showResultsOfSearchArtist:artistArray];
    [self.userInterface reloadView];
}

- (void)showNoContent {
    [self.userInterface showEmptyResultMessage];
}

- (void)showError:(NSString *)error {
    [self.userInterface showError:error];
}

#pragma DZRArtistSearchModuleInterface delegate

- (void)searchArtistWithName:(NSString *)textSearch {
    [self.artistSearchInteractor searchArtistWithName:textSearch];
}

- (void)showDetailOfArtist:(DZRArtist *)artist {
    [self.artistSearchWireframe presentArtistDetail:artist];
}

@end
