//
//  DZArtistDetailViewController.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailViewController.h"
#import "DZRArtistTrackTableViewCell.h"
#import "Modules.h"

@interface DZRArtistDetailViewController() <UITableViewDelegate, UITableViewDataSource, DZRArtistTrackProtocol, UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *nameAlbum;
@property (nonatomic, weak) IBOutlet UILabel *nameArtist;
@property (nonatomic, weak) IBOutlet UILabel *numberTracks;
@property (nonatomic, weak) IBOutlet UITableView *tableViewTracks;
@property (nonatomic, weak) IBOutlet ImageViewLoad *artistPicture;
@property (nonatomic, weak) IBOutlet ImageViewLoad *albumPicture;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *heightViewTop;

@property (nonatomic, assign) NSInteger currentRowPlayling;

@end

@implementation DZRArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self.eventHandler getOneAlbumOf:self.artist];
}

- (void) configureView {
    self.heightViewTop.constant = self.view.frame.size.height / 2;
    self.currentRowPlayling = -1;
    self.tableViewTracks.delegate = self;
    self.tableViewTracks.dataSource = self;
    self.tableViewTracks.estimatedRowHeight = 60;
    self.tableViewTracks.rowHeight = UITableViewAutomaticDimension;
    [self.tableViewTracks registerNib:[DZRArtistTrackTableViewCell getNib] forCellReuseIdentifier:[DZRArtistTrackTableViewCell getIdentifier]];
}

- (void) loadArtistWithAlbumView {
    self.nameArtist.text = self.artist.titleEntity;
    self.nameArtist.hidden = false;
    
    self.nameAlbum.text = self.artist.artistAlbum.titleEntity;
    self.nameAlbum.hidden = false;
    
    [self.artistPicture loadImage:self.artist.pictureUrl];
    [self.albumPicture loadImage:self.artist.artistAlbum.pictureUrl];
}

- (void) loadArtistWithTrackView {
    self.numberTracks.text =  [NSString stringWithFormat:@"%lu tracks",(unsigned long)self.artist.artistAlbum.trackList.arrayItems.count];
    [self reloadView];
}

#pragma - Actions

- (IBAction)closeCurrentView:(id)sender {
    [self.eventHandler dismissViewDetail];
}

#pragma - ScrollViewDelegate

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"CONTENT TABLEVIEW %f", self.tableViewTracks.contentOffset.y);
    
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
    [self loadArtistWithAlbumView];
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
    [self.tableViewTracks reloadData];
}

#pragma - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artist.artistAlbum.trackList.arrayItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DZRTrack *track = self.artist.artistAlbum.trackList.arrayItems[indexPath.row];
    
    DZRArtistTrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DZRArtistTrackTableViewCell getIdentifier] forIndexPath:indexPath];
    cell.eventPlayer = self;
    cell.index = indexPath.row;
    cell.nameTrack.text = track.titleEntity;
    cell.numberTrack.text = [NSString stringWithFormat:@"#%ld", (long)indexPath.row];
    cell.playButton.selected = indexPath.row == self.currentRowPlayling;
    return cell;
}


#pragma - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentRowPlayling == indexPath.row) {
        [self stopSongAtIndex:indexPath.row];
    } else {
        [self startSongAtIndex:indexPath.row];
    }
}

#pragma - DZRArtistTrackProtocol

- (void)stopSongAtIndex:(NSInteger)index {
    DZRTrack *track = self.artist.artistAlbum.trackList.arrayItems[index];
    self.currentRowPlayling = -1;
    [self.eventHandler stopSong:track];
    [self.tableViewTracks reloadRowsAtIndexPaths:[self.tableViewTracks indexPathsForVisibleRows]  withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (void)startSongAtIndex:(NSInteger)index {
    DZRTrack *track = self.artist.artistAlbum.trackList.arrayItems[index];
    self.currentRowPlayling = index;
    [self.eventHandler launchSong:track];
    [self.tableViewTracks reloadRowsAtIndexPaths:[self.tableViewTracks indexPathsForVisibleRows]  withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
