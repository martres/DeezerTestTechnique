//
//  DZArtistDetailWireframe.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"
#import "DZRRootWireframe.h"

/**
 @protocol DZRArtistDetailWireframe
 @brief DZRArtistDetailWireframe interface
 @description wireframe of the artist detail to show the detail of an artist
 **/

@interface DZRArtistDetailWireframe : NSObject

/**
 @brief presentArtistDetailFromViewController
 @params viewController: view controller need to be present
 @params detailArtist: artist to send the module
 @params rootWireFrame: root wireframe to a reference on rootViewController
 **/

- (void)presentArtistDetailFromViewController:(UIViewController *)viewController detailArtist:(DZRArtist *)detailArtist rootWireframe:(DZRRootWireframe *)rootWireframe;

- (void)dismissArtistDetail;

@end
