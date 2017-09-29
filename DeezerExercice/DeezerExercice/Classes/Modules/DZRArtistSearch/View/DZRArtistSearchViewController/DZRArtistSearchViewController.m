//
//  DZRArtistSearchViewController.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtistSearchViewController.h"
#import "DZRArtistCollectionViewCell.h"

@interface DZRArtistSearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *artists;

@end

@implementation DZRArtistSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
    self.navigationItem.title = @"Search Artist";
    [self.noResultsView setHidden:false];
}

- (void)showEmptyResultMessage {
    self.collectionView.hidden = true;
    self.noResultsView.hidden = false;
}

- (void) reloadView {
    [self.collectionView reloadData];
}

- (void)showResultsOfSearchArtist {
    self.noResultsView.hidden = true;
    self.collectionView.hidden = false;

    
    [self reloadView];
}

#pragma - DZRArtistSearchInterface

- (void)searchArtistWithName:(NSString *)textSearch {
    
}

//#pragma - Search
//
//- (void)searchArtistsWithName:(NSString *)name {
//    NSString *urlRequest = [NSString stringWithFormat:@"http://api.deezer.com/search/artist?q=%@", name];
//    NSURLRequest *APIRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlRequest]];
//
//    [NSURLConnection sendAsynchronousRequest:APIRequest
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                               if (connectionError) {
//                                   // TODO
//                               }
//                               else {
//                                   NSDictionary *retData = [NSJSONSerialization JSONObjectWithData:data
//                                                                                           options:kNilOptions
//                                                                                             error:&connectionError];
//                                   NSLog(@"%@", [retData objectForKey:@"data"]);
//                                   self.artists = [retData objectForKey:@"data"];
//                                   [self.collectionView reloadData];
//                               }
//                           }];
//}

#pragma - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchArtistWithName:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

#pragma - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.artists.count;
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
