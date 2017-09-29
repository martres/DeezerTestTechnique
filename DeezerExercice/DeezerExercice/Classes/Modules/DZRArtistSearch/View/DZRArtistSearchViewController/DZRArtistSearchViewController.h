//
//  DZRArtistSearchViewController.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInterface.h"
#import "DZArtistSearchModuleInterface.h"

@interface DZRArtistSearchViewController : UIViewController<DZRArtistSearchInterface>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet UIView *noResultsView;

@property (nonatomic, strong) id<DZRArtistSearchModuleInterface> eventHandler;

@end

