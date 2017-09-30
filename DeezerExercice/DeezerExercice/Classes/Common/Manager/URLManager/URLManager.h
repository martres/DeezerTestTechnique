//
//  URLManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "EnumEndPoint.h"

@interface URLManager : NSObject

+ (NSString * _Nonnull)urlDeezerBuilder:(NSString  * _Nullable)data endPoint:(EndPoint)endPoint;

@end
