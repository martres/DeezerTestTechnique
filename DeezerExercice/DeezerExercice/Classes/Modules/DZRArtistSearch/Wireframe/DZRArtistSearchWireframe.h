//
//  DZArtistSearchWireframe.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@class DZRRootWireframe;
@class DZRArtistDetailWireframe;
@class DZRArtistSearchPresenter;

@interface DZRArtistSearchWireframe : NSObject

@property (nonatomic, strong) DZRRootWireframe *rootWireframe;
@property (nonatomic, strong) DZRArtistDetailWireframe *artistDetailWireframe;
@property (nonatomic, strong) DZRArtistSearchPresenter *searchPresenter;



/**
 @brief present the current view controller of the module : DZRArtistSearchViewController
 @discussion: Call the wireframe of DZArtistDetail Module to present the view from DZArtistSearchViewController
 **/

- (void)presentArtistSearchFromWindow:(UIWindow *)window;

/**
 @brief show DZRArtistDetailViewController
 @discussion: Call the wireframe of DZArtistDetail Module to present the view from DZArtistSearchViewController
 **/

- (void)presentArtistDetail;

@end
