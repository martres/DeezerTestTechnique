//
//  DZRAlbumService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Service.h"
#import "Manager.h"

@implementation DZRAlbumService

/*
 * @brief get one album
 * @params artistId : id of the artist to search one album of an artist
 * @params completion : to get the result of the service
 * @discussion function to get only one album of the artist with his id (only take the first album)
 */

- (void)getOneAlbum:(NSString *)artistId completion:(DZRAlbumCompletion)completion {
    NSString *urlGetOneAlbum = [URLManager urlDeezerBuilder:artistId endPoint:GET_ONE_ALBUM_ARTIST];
    
    [[APIManager sharedInstance] get:urlGetOneAlbum completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            completion(nil, error.debugDescription);
        } else {
            DZRAlbum *obj = [self objectFromData:data];
            if (obj == nil) {
                completion(nil, @"Impossible to get the album.");
            } else {
                completion(obj, nil);
            }
        }
    }];
}

#pragma - BaseService

- (DZRAlbum *)objectFromData:(NSData *)data {
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        return nil;
    } else {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSArray *arrayAlbums = [object objectForKey:@"data"];
            if ([arrayAlbums count] > 0) {
                NSDictionary *albumDico = [arrayAlbums objectAtIndex:0];
                DZRAlbum *obj = [[DZRAlbum alloc] initWithDictionary:albumDico];
                return obj;
            }
            return nil;
        }
    }
    return nil;
}


@end
