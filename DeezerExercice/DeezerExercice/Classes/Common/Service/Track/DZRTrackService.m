//
//  DZRTrackService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRTrackService.h"

@implementation DZRTrackService

-(void)getTracksFromAlbum:(NSString *)albumId completion:(DZRTracksCompletions)completion {
    NSString *urlGetTrackFromAlbum = [URLManager urlDeezerBuilder:albumId endPoint:GET_TRACKS_ALBUM];
    [[APIManager sharedInstance] get:urlGetTrackFromAlbum completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            completion(nil, error.debugDescription);
        } else {
            DZRTrack *obj = [self objectFromData:data];
            if (obj == nil) {
                completion(nil, @"An error occured, please retry");
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
            DZRAlbum *obj = [[DZRAlbum alloc] initWithDictionary:object];
            return obj;
        }
    }
    return nil;
}

@end
