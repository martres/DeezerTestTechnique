//
//  EnumHTTPMethod.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

#define enumString(arg) (@""#arg)
typedef enum HTTPMethod: NSInteger {
    GET,
    POST,
    PUT,
    DELETE,
    PATCH
} HTTPMethod ;
