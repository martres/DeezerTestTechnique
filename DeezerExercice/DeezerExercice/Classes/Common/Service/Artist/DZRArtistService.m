//
//  DZArtistService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Service.h"
#import "Manager.h"

@implementation DZRArtistService

/*
 * @brief Search artist
 * @params name : string for search an artist
 * @params completion : to get the result of the service
 * @discussion function to search an artist by a string
 */

- (void)searchArtists:(NSString *)name completion:(DZRArtistCompletion)completion {
    NSString *urlSearchArtist = [URLManager urlDeezerBuilder:name endPoint:SEARCH_ARTIST];
    [[APIManager sharedInstance] get:urlSearchArtist completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            completion(nil, error.debugDescription);
        } else {
            DZRArtistArray *obj = [self objectFromData:data];
            if (obj == nil) {
                completion(nil, @"Impossible to get an artist.");
            } else {
                completion(obj, nil);
            }
        }
    }];
}

/*
 * @brief More artist
 * @params artistArray : entity of DZRAristArray to get the next url for more artist
 * @params completion : to get the result of the service
 * @discussion function to get more artist with the same search
 * nextURL is from the request of search artist
 */

- (void)moreArtists:(DZRArtistArray *)artistArray completion:(DZRArtistCompletion)completion {
    NSString* urlMoreArtist = artistArray.nextURL;
    [[APIManager sharedInstance] get:urlMoreArtist completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            completion(nil, error.debugDescription);
        } else {
            DZRArtistArray *obj = [self objectFromData:data];
            if (obj == nil) {
                completion(nil, @"Impossible to get more artists");
            } else {
                completion(obj, nil);
            }
        }
    }];
}

#pragma - BaseService

- (DZRArtistArray *)objectFromData:(NSData *)data {
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        return nil;
    } else {
        if ([object isKindOfClass:[NSDictionary class]]) {
            DZRArtistArray *obj = [[DZRArtistArray alloc] initWithDictionary:object];
            return obj;
        }
    }
    return nil;
}

@end
