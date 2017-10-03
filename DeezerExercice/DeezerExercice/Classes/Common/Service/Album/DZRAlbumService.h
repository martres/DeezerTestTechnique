//
//  DZRAlbumService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseService.h"
#import "Entities.h"

/*
 * @brief DZRAlbumCompletion
 * @params album : album of artist if the service succes
 * @params error : error string if the service fail
 * @discussion completion of each service of an album
 */

typedef void(^DZRAlbumCompletion)(DZRAlbum *album, NSString *error);

@interface DZRAlbumService : NSObject<BaseService>

/*
 * @brief get one album
 * @params artistId : id of the artist to search one album of an artist
 * @params completion : to get the result of the service
 * @discussion function to get only one album of the artist with his id (only take the first album)
 */

- (void)getOneAlbum:(NSString *)artistId completion:(DZRAlbumCompletion)completion;

@end
