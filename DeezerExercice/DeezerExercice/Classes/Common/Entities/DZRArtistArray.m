//
//  DZRArtistArray.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistArray.h"
#import "DZRArtist.h"

@implementation DZRArtistArray

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.nextURL = [dictionary objectForKey:@"next"];
        NSArray *arrayArtists = [dictionary objectForKey:@"data"];
        if (arrayArtists == nil) {
            return nil;
        }
        
        for (NSDictionary *artistDictionnary in arrayArtists) {
            DZRArtist *artist = [[DZRArtist alloc] initWithDictionary:artistDictionnary];
            [self.artists addObject:artist];
        }
    }
    return self;
}

@end
