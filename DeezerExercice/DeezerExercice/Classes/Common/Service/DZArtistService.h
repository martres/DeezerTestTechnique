//
//  DZArtistService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "DZRArtist.h"

@interface DZArtistService : NSObject<BaseService>

- (void)getArtists:(NSString *)name;

@end
