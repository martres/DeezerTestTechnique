//
//  BaseService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief BaseService protocol
 * @discussion Protocol for every service
 */

@protocol BaseService <NSObject>

- (id)objectFromData:(NSData *)data;

@end

@interface BaseServiceObject : NSObject

@end
