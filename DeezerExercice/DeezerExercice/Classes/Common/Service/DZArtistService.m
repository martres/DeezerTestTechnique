//
//  DZArtistService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZArtistService.h"

@implementation DZArtistService


- (void)getArtists:(NSString *)name {
    NSString *url = [URLManager urlForSearchArtistsWithName:name];
    [[APIManager sharedInstance] get:[URLManager urlForSearchArtistsWithName:url] completion:^(NSData *data, NSError *error) {
        
    }];
}


@end
