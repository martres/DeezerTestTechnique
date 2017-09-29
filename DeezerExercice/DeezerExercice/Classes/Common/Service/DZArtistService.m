//
//  DZArtistService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZArtistService.h"
#import "ApiManager.h"

@implementation DZArtistService

- (void)getArtists:(NSArray *)artists {
    [[APIManager sharedInstance] get:"" completion:<#^(NSData *data, NSError *error)completion#>]
    
}


@end
