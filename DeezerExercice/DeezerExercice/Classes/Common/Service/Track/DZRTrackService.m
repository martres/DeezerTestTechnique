//
//  DZRTrackService.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Service.h"
#import "Manager.h"

@implementation DZRTrackService

-(void)getTracksFromAlbum:(NSString *)albumId completion:(DZRTracksCompletions)completion {
    NSString *urlGetTrackFromAlbum = [URLManager urlDeezerBuilder:albumId endPoint:GET_TRACKS_ALBUM];
    [[APIManager sharedInstance] get:urlGetTrackFromAlbum completion:^(NSData *data, NSError *error) {
        if (error != nil) {
            completion(nil, error.debugDescription);
        } else {
            DZRTrackArray *tracks = [self objectFromData:data];
            if (tracks == nil) {
                completion(nil, @"Impossible to get tracks of the album");
            } else {
                completion(tracks, nil);
            }
        }
    }];
}

#pragma - BaseService

- (DZRTrackArray *)objectFromData:(NSData *)data {
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        return nil;
    } else {
        if ([object isKindOfClass:[NSDictionary class]]) {
            DZRTrackArray *obj = [[DZRTrackArray alloc] initWithDictionary:object];
            return obj;
        }
    }
    return nil;
}

@end
