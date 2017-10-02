//
//  BaseService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@protocol BaseService <NSObject>

- (id)objectFromData:(NSData *)data;

@end

@interface BaseServiceObject : NSObject

@end
