//
//  ServiceManager.m
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Service.h"
#import "Manager.h"
#import "Entities.h"

@implementation ServiceManager

+ (id)sharedInstance {
    static ServiceManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

/*
 * @brief callerWithEntityService
 * @params entityService : enum entityService for create the service
 * @params nameService : enum nameService for calling the good function
 * @params data : to handle each kind of data to send
 * @params completion for waiting the answer of a service
 * @discussion builder to create the service and calling the right function of the service
 */

- (void)callerWithEntityService:(EntityService)entityService nameService:(NameService)nameService data:(id)data completion:(ServiceCompletion)completion{
    switch (entityService) {
        case ARTIST: {
            DZRArtistService *service = [[DZRArtistService alloc] init];
            [self callArtistService:service nameService:nameService data:data completion:completion];
            return;
        }
            
        case ALBUM: {
            DZRAlbumService *service = [[DZRAlbumService alloc] init];
            [self callAlbumService:service nameService:nameService data:data completion:completion];
            return;
        }

        case TRACK: {
            DZRTrackService *service = [[DZRTrackService alloc] init];
            [self callTrackService:service nameService:nameService data:data completion:completion];
            return;
        }

        default:
            NSLog(@"WRONG ENTITY SERVICE NAME");
            break;
    }
}

/*
 * @brief callArtistService
 * @params service : DZRArtistService service to call the right function
 * @params nameService : enum nameService for calling the good function
 * @params data : to handle each kind of data to send
 * @params completion for waiting the answer of a service
 * @discussion builder to calling the right function of artist Service
 */

- (void) callArtistService:(DZRArtistService *)service nameService:(NameService)nameService data:(id)data completion:(ServiceCompletion)completion{
    switch (nameService) {
        case SEARCH_ARTIST_WITH_PARAM: {
            [service searchArtists:data completion:completion];
            return;
        }
        
        case MORE_ARTIST: {
            [service moreArtists:data completion:completion];
            return;
        }
        default:
            NSLog(@"WRONG NAME SERVICE FOR ARTIST SERVICE");
            break;
    }
}

/*
 * @brief callArtistService
 * @params service : DZRAlbumService service to call the right function
 * @params nameService : enum nameService for calling the good function
 * @params data : to handle each kind of data to send
 * @params completion for waiting the answer of a service
 * @discussion builder to calling the right function of album Service
 */

- (void) callAlbumService:(DZRAlbumService *)service nameService:(NameService)nameService data:(id)data completion:(ServiceCompletion)completion {
    switch (nameService) {
        case GET_ONE_ALBUM: {
            [service getOneAlbum:data completion:completion];
            return;
        }
        default:
            NSLog(@"WRONG NAME SERVICE FOR ALBUM SERVICE");
            break;
    }
}

/*
 * @brief callArtistService
 * @params service : DZRTrackService service to call the right function
 * @params nameService : enum nameService for calling the good function
 * @params data : to handle each kind of data to send
 * @params completion for waiting the answer of a service
 * @discussion builder to calling the right function of track Service
 */

- (void) callTrackService:(DZRTrackService *)service nameService:(NameService)nameService data:(id)data completion:(ServiceCompletion)completion {
    switch (nameService) {
        case GET_TRACKS_OF_ALBUM: {
            [service getTracksFromAlbum:data completion:completion];
            return;
        }
        default:
            NSLog(@"WRONG NAME SERVICE FOR TRACK SERVICE");
            break;
    }
}

@end
