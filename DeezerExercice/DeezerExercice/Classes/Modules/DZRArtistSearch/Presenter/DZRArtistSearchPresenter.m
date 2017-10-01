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
        if (artistArray.arrayItems.count == 0) {
            [self showNoContent];
        } else {
            [self showResultsSearch:artistArray];
        }
    } else {
        [self showError:error];
    }
}

- (void)showResultsSearch:(DZRArtistArray *)artistArray {
    [self.userInterface showResultsOfSearchArtist:artistArray];
}

- (void)showNoContent {
    [self.userInterface showEmptyResultMessage];
    [self.userInterface reloadView];
}

- (void)showError:(NSString *)error {
    [self.userInterface showError:error];
    [self.userInterface reloadView];
}

#pragma DZRArtistSearchModuleInterface delegate

- (void)searchArtistWithName:(NSString *)textSearch {
    [self.artistSearchInteractor searchArtistWithName:textSearch];
}

@end
