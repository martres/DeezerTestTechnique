//
//  DZRTrackService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "DZRTrack.h"
#import "DZRTrackArray.h"

typedef void(^DZRTracksCompletions)(DZRTrackArray *tracks, NSString *error);

@interface DZRTrackService : NSObject<BaseService>

- (void)getTracksFromAlbum:(NSString *)albumId completion:(DZRTracksCompletions)completion;

@end
