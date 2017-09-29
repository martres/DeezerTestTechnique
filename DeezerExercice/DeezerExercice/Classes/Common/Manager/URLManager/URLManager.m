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

+ (NSString *)urlForSearchArtistsWithName:(NSString *)name {
    return [NSString stringWithFormat:@"%@search/artist?q=%@", baseURL, name];
}

@end
