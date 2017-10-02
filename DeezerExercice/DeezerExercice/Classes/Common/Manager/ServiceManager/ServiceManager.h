//
//  ServiceManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "EnumService.h"

typedef void(^ServiceCompletion)(id, NSString *error);

@interface ServiceManager : NSObject

+ (id)sharedInstance;
- (void)callerWithEntityService:(EntityService)entityService nameService:(NameService)nameService data:(id)data completion:(ServiceCompletion)completion;

@end
