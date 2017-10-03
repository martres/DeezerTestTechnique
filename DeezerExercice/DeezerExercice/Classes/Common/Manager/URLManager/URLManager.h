//
//  URLManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "EnumEndPoint.h"

/*
 * @brief URLManager
 * @discussion Object to create an url with data and the end point
 */

@interface URLManager : NSObject

/*
 * @brief urlDeezerBuilder
 * @params data : string of the data to build the url
 * @params endPoint : enum endPoint to get the right one
 * @discussion builder to create the url of Deezer
 * @return return url string for calling deezer service
 */

+ (NSString * _Nonnull)urlDeezerBuilder:(NSString  * _Nullable)data endPoint:(EndPoint)endPoint;

@end
