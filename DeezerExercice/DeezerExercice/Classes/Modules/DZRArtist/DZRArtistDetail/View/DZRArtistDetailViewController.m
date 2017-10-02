//
//  DZArtistDetailViewController.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailViewController.h"

@implementation DZRArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void) configureView {
    self.navigationItem.title = self.artist.titleEntity;
}

#pragma - DZRArtistDetailInterface

- (void) showError:(NSString *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An error occured"
                                                        message:error
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    });
}

- (void) showResultsOfGetOneAlbum:(DZRArtist *)artist {
    self.artist = artist;
    [self.eventHandler getTracksOf:artist];
}

- (void) showResultsOfTrackOfAlbum:(DZRArtist *)artist {
    self.artist = artist;
}

- (void) startingSong:(DZRTrack *)track {
    
}

- (void) stoppingSong:(DZRTrack *)track {
    
}

- (void) reloadView {
    
}

@end
