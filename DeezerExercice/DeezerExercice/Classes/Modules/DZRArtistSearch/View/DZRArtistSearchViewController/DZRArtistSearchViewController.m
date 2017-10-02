//
//  DZRArtistSearchViewController.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistSearchViewController.h"
#import "DZRArtistCollectionViewCell.h"
#import "DZRArtist.h"
#import "UIView+round.h"

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
}

- (void) reloadView {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.collectionView.hidden = false;
        self.noResultsView.hidden = true;
        [self.collectionView reloadData];
    });
}

- (void)insertArtists:(DZRArtistArray *)artistArray {
    DZRArtistArray *newArtistArray = [[DZRArtistArray alloc] init];
    newArtistArray.nextURL = artistArray.nextURL;
    newArtistArray.arrayItems = self.artists.arrayItems;
    [newArtistArray.arrayItems addObjectsFromArray:artistArray.arrayItems];
    self.artists = newArtistArray;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
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
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (bottomEdge >= scrollView.contentSize.height) {
        [self.eventHandler showMoreArtists:self.artists];
    }
}

#pragma - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
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
    if (artist.pictureCache) {
        [cell.artistImage setImage:artist.pictureCache];
    } else {
        [cell loadImageArtist:artist.pictureUrl indexPath:indexPath completion:^(UIImage *image, NSIndexPath *oldIndexPath) {
            DZRArtist *oldArtist = (DZRArtist *)self.artists.arrayItems[oldIndexPath.row];
            oldArtist.pictureCache = image;
        }];
    }
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
