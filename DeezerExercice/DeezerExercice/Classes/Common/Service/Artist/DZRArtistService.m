//
//  DZArtistService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistService.h"

@implementation DZRArtistService

- (void)searchArtists:(NSString *)name completion:(DZRArtistCompletion)completion {
    NSString *urlSearchArtist = [URLManager urlDeezerBuilder:name endPoint:SEARCH_ARTIST];
    [[APIManager sharedInstance] get:urlSearchArtist completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            completion(nil, error.debugDescription);
        } else {
            DZRArtistArray *obj = [self objectFromData:data];
            if (obj == nil) {
                completion(nil, @"An error occured, please retry");
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
