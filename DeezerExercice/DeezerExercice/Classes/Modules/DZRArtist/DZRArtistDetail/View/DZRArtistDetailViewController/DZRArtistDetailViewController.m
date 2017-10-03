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
@property (nonatomic, assign) CGFloat   heightMaxViewTop;

@end

@implementation DZRArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self.eventHandler getOneAlbumOf:self.artist];
}

- (void) configureView {
    //To change the color background of the status bar
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1];
    [self.view addSubview:view];
    
    [self.artistPicture rounded:self.artistPicture.frame.size.width / 2];
    
    self.heightViewTop.constant = self.view.frame.size.height / 2;
    self.heightMaxViewTop = self.heightViewTop.constant;
    
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
    self.numberTracks.hidden = false;
    
    self.tableViewTracks.hidden = false;
    [self reloadView];
}

#pragma - Actions

- (IBAction)closeCurrentView:(id)sender {
    [self.eventHandler dismissViewDetail];
}

#pragma - ScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentSize.height < self.tableViewTracks.frame.size.height) {
        return;
    }
    
    //Change the HeightViewTop to show all the rows inside the tableView
    CGFloat newHeight = self.heightMaxViewTop - self.tableViewTracks.contentOffset.y;
    if (newHeight < 60 || [self isReachingBottomOfTableView:scrollView]) {
        newHeight = 60;
    }
    [self.view layoutIfNeeded];
    self.heightViewTop.constant = newHeight;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(BOOL)isReachingBottomOfTableView:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    if (y >= h) {
        return TRUE;
    }
    return FALSE;
}


#pragma - DZRArtistDetailInterface

- (void) showError:(NSString *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An error occured"
                                                        message:error
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alert show];
}

- (void) showResultsOfGetOneAlbum:(DZRArtist *)artist {
    self.artist = artist;
    [self loadArtistWithAlbumView];
    [self.eventHandler getTracksOf:artist];
}

- (void) showResultsOfTrackOfAlbum:(DZRArtist *)artist {
    self.artist = artist;
    [self loadArtistWithTrackView];
}

- (void) startingSong:(DZRTrack *)track {
    [self.tableViewTracks reloadRowsAtIndexPaths:[self.tableViewTracks indexPathsForVisibleRows]  withRowAnimation:UITableViewRowAnimationNone];
}

- (void) stoppingSong:(DZRTrack *)track {
    [self.tableViewTracks reloadRowsAtIndexPaths:[self.tableViewTracks indexPathsForVisibleRows]  withRowAnimation:UITableViewRowAnimationNone];
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
    cell.numberTrack.text = [NSString stringWithFormat:@"#%ld", (long)indexPath.row + 1];
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
}

- (void)startSongAtIndex:(NSInteger)index {
    DZRTrack *track = self.artist.artistAlbum.trackList.arrayItems[index];
    self.currentRowPlayling = index;
    [self.eventHandler launchSong:track];
}

@end
