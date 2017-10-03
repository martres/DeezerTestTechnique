//
//  DZRTrackService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "Entities.h"

/*
 * @brief DZRTracksCompletions
 * @params tracks : array of track if the service succes
 * @params error : error string if the service fail
 * @discussion completion of each service of an track
 */

typedef void(^DZRTracksCompletions)(DZRTrackArray *tracks, NSString *error);

@interface DZRTrackService : NSObject<BaseService>

/*
 * @brief getTracksFromAlbum
 * @params albumId : id of the album
 * @params completion : to get the result of the service
 * @discussion get tracks of an album with his id
 */

- (void)getTracksFromAlbum:(NSString *)albumId completion:(DZRTracksCompletions)completion;

@end
