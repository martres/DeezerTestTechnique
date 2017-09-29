//
//  DZRArtist.m
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "DZRArtist.h"

@implementation DZRArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.artistIdentifier = [dictionary objectForKey:@"id"];
        self.artistName = [dictionary objectForKey:@"name"];
        self.artistPictureUrl = [dictionary objectForKey:@"picture"];
    }
    return self;
}
@end
