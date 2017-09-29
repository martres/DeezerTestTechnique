//
//  DZRArtist.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtist.h"

@implementation DZRArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.identifierEntity = dictionary objectForKey:@"id"];
        self.artistName = [dictionary objectForKey:@"name"];
        self.artistPictureUrl = [dictionary objectForKey:@"picture"];
    }
    return self;
}
@end
