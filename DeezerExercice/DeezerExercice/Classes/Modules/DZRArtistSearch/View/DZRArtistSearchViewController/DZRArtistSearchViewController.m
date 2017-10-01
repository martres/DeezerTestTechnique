//
//  DZRArtistSearchViewController.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistSearchViewController.h"
#import "DZRArtistCollectionViewCell.h"

@interface DZRArtistSearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) DZRArtistArray *artists;

@end

@implementation DZRArtistSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
    self.navigationItem.title = @"Artist Search";
}

- (void)searchArtistWithName:(NSString *)textSearch {
    [self.eventHandler searchArtistWithName:textSearch];
}

#pragma - DZRArtistSearchInterface

- (void)showResultsOfSearchArtist:(DZRArtistArray *)artists {
    self.artists = artists;
    [self reloadView];
}

- (void) reloadView {
    [self.collectionView reloadData];
}

- (void)showEmptyResultMessage {
    self.collectionView.hidden = true;
    self.noResultsView.hidden = false;
}

- (void) showError:(NSString *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An error occured"
                                                    message:error
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.collectionView.hidden = false;
    self.noResultsView.hidden = false;
    searchBar.text = @"";
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self searchArtistWithName:searchText];
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
    NSString *CellIdentifier = [DZRArtistCollectionViewCell identifierCell];
    DZRArtistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    NSDictionary *artistDictionary = [self.artists objectAtIndex:indexPath.row];
//    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[artistDictionary objectForKey:@"picture"]]];
//    cell.artistImage.image = [UIImage imageWithData:imageData];
//    cell.artistName.text = [artistDictionary objectForKey:@"name"];
    return cell;
}

@end
