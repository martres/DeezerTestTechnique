//
//  DZRTrackService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "DZRTrack.h"

typedef void(^DZRTracksCompletions)(NSMutableArray *album, NSString *error);

@interface DZRTrackService : NSObject<BaseService>

- (void)getTracksFromAlbum:(NSString *)albumId completion:(DZRTracksCompletions)completion;

@end
