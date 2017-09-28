//
//  DZArtistSearchWireframe.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@class DZRootWireframe;
@class DZArtistDetailWireframe;
@class DZArtistSearchPresenter;

@interface DZArtistSearchWireframe : NSObject

@property (nonatomic, strong) DZRootWireframe *rootWireframe;
@property (nonatomic, strong) DZArtistDetailWireframe *artistDetailWireframe;
@property (nonatomic, strong) DZArtistSearchPresenter *searchPresenter;

- (void)presentArtistSearchFromWindow:(UIWindow *)window;
- (void)presentArtistDetail;

@end
