//
//  DZArtistDetailWireframe.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtist.h"
#import <Foundation/Foundation.h>

@interface DZRArtistDetailWireframe : NSObject

- (void)presentArtistDetailFromViewController:(UIViewController *)viewController detailArtist:(DZRArtist *)detailArtist;
- (void)dismissArtistDetail;

@end
