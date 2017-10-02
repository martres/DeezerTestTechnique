//
//  DZArtistDetailWireframe.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"
#import "DZRRootWireframe.h"

@interface DZRArtistDetailWireframe : NSObject

- (void)presentArtistDetailFromViewController:(UIViewController *)viewController detailArtist:(DZRArtist *)detailArtist rootWireframe:(DZRRootWireframe *)rootWireframe;
- (void)dismissArtistDetail;

@end
