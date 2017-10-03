//
//  ServiceManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "EnumService.h"

/*
 * @brief ServiceCompletion
 * @params id : data success example (DZRArtistArray)
 * @params error : return an error if the request failed
 * @discussion completion for waiting the answer of a service
 */

typedef void(^ServiceCompletion)(id, NSString *error);

/*
 * @brief ServiceManager Singleton
 * @discussion Singleton to manage every kind of Service
 */

@interface ServiceManager : NSObject

+ (id)sharedInstance;

/*
 * @brief callerWithEntityService
 * @params entityService : enum entityService for create the service
 * @params nameService : enum nameService for calling the good function
 * @params data : to handle each kind of data to send
 * @params completion for waiting the answer of a service
 * @discussion builder to create the service and calling the right function of the service
 */

- (void)callerWithEntityService:(EntityService)entityService nameService:(NameService)nameService data:(id)data completion:(ServiceCompletion)completion;

@end
