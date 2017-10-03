//
//  DZRArtistSearchViewController.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistSearchViewController.h"
#import "DZRArtistCollectionViewCell.h"
#import "Modules.h"

@interface DZRArtistSearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (nonatomic, strong) DZRArtistArray *artists;

// timerSearchArtist to handle the request of search while the user tap
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
}

- (void) reloadView {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.collectionView.hidden = false;
        self.noResultsView.hidden = true;
        [self.collectionView reloadData];
    });
}

- (void)insertArtists:(DZRArtistArray *)artistArray {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.artists = artistArray;
        [self.collectionView performBatchUpdates:^{
            NSMutableArray *arrayWithIndexPaths = [NSMutableArray array];
            for (NSUInteger i = [self.collectionView numberOfItemsInSection:0]; i < self.artists.arrayItems.count ; i++) {
                [arrayWithIndexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
            }
            [self.collectionView insertItemsAtIndexPaths:arrayWithIndexPaths];
        } completion:nil];
    });
}

- (void) showTopOfScroll {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView setContentOffset:CGPointZero animated:true];
    });
}

- (void)showEmptyResultMessage {
    self.artists = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.collectionView.hidden = true;
        self.noResultsView.hidden = false;
    });
}

- (void) showError:(NSString *)error {
    self.artists = nil;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    float reload_distance = 50;
    if(y > h - reload_distance)
    {
        [self.eventHandler showMoreArtists:self.artists];
    }
}

#pragma - UISearchBarDelegate

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
    [cell.artistImage loadImage:artist.pictureUrl];
    [cell.artistImage rounded:cell.artistImage.frame.size.width / 2];
    cell.artistName.text = artist.titleEntity;
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
    CGFloat width = collectionView.frame.size.width / 3;
    CGSize size = CGSizeMake(width, width);
    return size;
}

@end
