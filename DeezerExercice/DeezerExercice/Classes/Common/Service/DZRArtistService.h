//
//  DZArtistService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "DZRArtistArray.h"

typedef void(^DZRArtistCompletion)(DZRArtistArray *artistArray, NSString *error);

@interface DZRArtistService : NSObject<BaseService>

- (void)getArtists:(NSString *)name completion:(DZRArtistCompletion)completion;

@end
