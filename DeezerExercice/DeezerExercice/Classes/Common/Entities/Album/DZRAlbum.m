//
//  DZRAlbum.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRAlbum.h"


@implementation DZRAlbum

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.titleEntity = [dictionary objectForKey:@"title"];
        self.pictureUrl = [dictionary objectForKey:@"cover"];
        self.tracklitURL = [dictionary objectForKey:@"tracklist"];
    }
    return self;
}

@end
