//
//  DZRArtistSearchViewController.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistSearchViewController.h"
#import "DZRArtistCollectionViewCell.h"
#import "DZRArtist.h"

@interface DZRArtistSearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (nonatomic, strong) DZRArtistArray *artists;
@property (nonatomic, assign) NSTimer *timerSearchArtist;

@end

@implementation DZRArtistSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
    self.navigationItem.title = @"Artist Search";
    [self.collectionView registerNib:[DZRArtistCollectionViewCell getNibOfCell] forCellWithReuseIdentifier:[DZRArtistCollectionViewCell getIdentifier]];
}

- (void)searchArtistWithName {
    if (![self.searchBar.text isEqualToString:@""]) {
        [self.eventHandler searchArtistWithName:self.searchBar.text];
    }
    [self.timerSearchArtist invalidate];
    self.timerSearchArtist = nil;
}

#pragma - DZRArtistSearchInterface

- (void)showResultsOfSearchArtist:(DZRArtistArray *)artists {
    self.artists = artists;
    [self reloadView];
}

- (void) reloadView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (void)showEmptyResultMessage {
    self.collectionView.hidden = true;
    self.noResultsView.hidden = false;
}

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

#pragma - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

#pragma - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.collectionView.hidden = false;
    self.noResultsView.hidden = false;
    searchBar.text = @"";
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (self.timerSearchArtist != nil) {
        [self.timerSearchArtist invalidate];
        self.timerSearchArtist = nil;
    }
    self.timerSearchArtist = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(searchArtistWithName) userInfo:nil repeats:false];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.artists.arrayItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DZRArtist *artist = self.artists.arrayItems[indexPath.row];
    
    NSString *CellIdentifier = [DZRArtistCollectionViewCell getIdentifier];
    DZRArtistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell loadImageArtist:artist.pictureUrl];
    cell.artistName.text = artist.titleEntity;
    [cell setNeedsLayout];
    return cell;
}

#pragma - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DZRArtist *artist = self.artists.arrayItems[indexPath.row];
    if (artist != nil) {
        [self.eventHandler showDetailOfArtist:artist];
    }
}

#pragma - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width / 2;
    CGSize size = CGSizeMake(width, width);
    return size;
}

@end
