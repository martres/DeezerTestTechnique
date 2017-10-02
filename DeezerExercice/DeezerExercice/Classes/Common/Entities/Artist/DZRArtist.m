//
//  DZRArtist.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "Entities.h"

@implementation DZRArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.titleEntity = [dictionary objectForKey:@"name"];
        self.pictureUrl = [dictionary objectForKey:@"picture"];
        self.artistAlbum = nil;
    }
    return self;
}

@end
