//
//  EnumHTTPMethod.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief HTTPMethod
 * @discussion Enum to handle a kind of request
 */

typedef enum HTTPMethod: NSInteger {
    GET,
    POST,
    PUT,
    DELETE,
    PATCH
    
} HTTPMethod;

/*
 * @brief HTTPMethodName
 * @discussion Array of NSString to handle a kind of request
 */

static NSString *const HTTPMethodName[] = {
    stringWithLiteral(GET),
    stringWithLiteral(POST),
    stringWithLiteral(PUT),
    stringWithLiteral(DELETE),
    stringWithLiteral(PATCH),
};
