//
//  DZArtistService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Entities.h"
#import "Service.h"

/*
 * @brief DZRArtistCompletion
 * @params artistArray : return an array of DZArtist if the service succes
 * @params error : error string if the service fail
 * @discussion completion of each service of an artist
 */

typedef void(^DZRArtistCompletion)(DZRArtistArray *artistArray, NSString *error);

@interface DZRArtistService : NSObject<BaseService>

/*
 * @brief Search artist
 * @params name : string for search an artist
 * @params completion : to get the result of the service
 * @discussion function to search an artist by a string
 */

- (void)searchArtists:(NSString *)name completion:(DZRArtistCompletion)completion;

/*
 * @brief More artist
 * @params artistArray : entity of DZRAristArray to get the next url for more artist
 * @params completion : to get the result of the service
 * @discussion function to get more artist with the same search
 * nextURL is from the request of search artist
 */

- (void)moreArtists:(DZRArtistArray *)artistArray completion:(DZRArtistCompletion)completion;

@end

