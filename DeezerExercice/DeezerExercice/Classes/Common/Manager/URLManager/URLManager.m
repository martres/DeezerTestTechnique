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

/*
 * @brief urlDeezerBuilder
 * @params data : string of the data to build the url
 * @params endPoint : enum endPoint to get the right one
 * @discussion builder to create the url of Deezer
 * @return return url string for calling deezer service
 */

+ (NSString *)urlDeezerBuilder:(NSString *)data endPoint:(EndPoint)endPoint {
    NSString *urlDeezer = @"";
    if (data != nil) {
        NSString *endPointFormat = [NSString stringWithFormat:EndPointName[endPoint], data];
        urlDeezer = [NSString stringWithFormat:@"%@%@", baseURL, endPointFormat];
    } else {
        urlDeezer = [NSString stringWithFormat:@"%@%@", baseURL, EndPointName[endPoint]];
    }
    return [urlDeezer stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
