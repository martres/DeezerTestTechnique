//
//  DZArtistService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Entities.h"
#import "Service.h"

typedef void(^DZRArtistCompletion)(DZRArtistArray *artistArray, NSString *error);

@interface DZRArtistService : NSObject<BaseService>

- (void)searchArtists:(NSString *)name completion:(DZRArtistCompletion)completion;
- (void)moreArtists:(DZRArtistArray *)artistArray completion:(DZRArtistCompletion)completion;

@end

