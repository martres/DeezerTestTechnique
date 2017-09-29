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
        self.albumIdentifier = [dictionary objectForKey:@"id"];
        self.albumName = [dictionary objectForKey:@"title"];
        self.albumCoverURL = [dictionary objectForKey:@"cover"];
        self.tracklitURL = [dictionary objectForKey:@"tracklist"];
        
        NSDictionary *artistDictionary = [dictionary objectForKey:@"artist"];
        self.artist = [[DZRArtist alloc] initWithDictionary:artistDictionary];
    }
    return self;
}

@end
