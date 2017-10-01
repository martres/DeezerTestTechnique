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
        
    }
}

#pragma DZRArtistSearchModuleInterface delegate

- (void)searchArtistWithName:(NSString *)textSearch {
    [self.artistSearchInteractorInput searchArtistWithName:textSearch];
}

@end
