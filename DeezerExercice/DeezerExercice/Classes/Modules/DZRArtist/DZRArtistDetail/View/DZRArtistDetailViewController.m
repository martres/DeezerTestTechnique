//
//  DZArtistDetailViewController.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailViewController.h"

@interface DZRArtistDetailViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UILabel *nameAlbum;
@property (nonatomic, weak) IBOutlet UILabel *nameArtist;
@property (nonatomic, weak) IBOutlet UILabel *numberTracks;
@property (nonatomic, weak) IBOutlet UITableView *tableViewTracks;
@property (nonatomic, weak) IBOutlet UIImageView *artistPicture;
@property (nonatomic, weak) IBOutlet UIImageView *albumPicture;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *heightViewTop;

@end

@implementation DZRArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self.eventHandler getOneAlbumOf:self.artist];
}

- (void) configureView {
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]]
}

#pragma - Actions

- (IBAction)closeCurrentView:(id)sender {
    [self.eventHandler dismissViewDetail];
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

#pragma - TableViewDataSource


#pragma - TableViewDelegate

@end
