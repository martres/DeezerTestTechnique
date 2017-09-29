//
//  BaseService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseService <NSObject>

+(id)objectFromData:(NSData *)data;

@end