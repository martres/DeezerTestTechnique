//
//  DZRAlbumService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "DZRAlbum.h"

typedef void(^DZRAlbumCompletion)(DZRAlbum *album, NSString *error);

@interface DZRAlbumService : NSObject<BaseService>

- (void)getOneAlbum:(NSString *)artistId completion:(DZRAlbumCompletion)completion;

@end
