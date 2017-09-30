//
//  URLManager.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "URLManager.h"

@implementation URLManager

static NSString *baseURL = @"http://api.deezer.com/";

+ (NSString *)urlDeezerBuilder:(NSString *)data endPoint:(EndPoint)endPoint {
    if (data != nil) {
        NSString *endPointFormat = [NSString stringWithFormat:EndPointName[endPoint], data];
        return [NSString stringWithFormat:@"%@%@", baseURL, endPointFormat];
    }
    return [NSString stringWithFormat:@"%@%@", baseURL, EndPointName[endPoint]];
}

@end
