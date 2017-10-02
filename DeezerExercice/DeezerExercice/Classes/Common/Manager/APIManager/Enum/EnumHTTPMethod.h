//
//  EnumHTTPMethod.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

typedef enum HTTPMethod: NSInteger {
    GET,
    POST,
    PUT,
    DELETE,
    PATCH
    
} HTTPMethod;

static NSString *const HTTPMethodName[] = {
    stringWithLiteral(GET),
    stringWithLiteral(POST),
    stringWithLiteral(PUT),
    stringWithLiteral(DELETE),
    stringWithLiteral(PATCH),
};
