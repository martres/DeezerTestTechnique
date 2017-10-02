//
//  DZRArtistArray.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistArray.h"

@implementation DZRArtistArray

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        NSArray *arrayArtists = [dictionary objectForKey:@"data"];
        if (arrayArtists == nil) {
            return nil;
        }
        self.arrayItems = [[NSMutableArray alloc] init];
        for (NSDictionary *artistDictionnary in arrayArtists) {
            DZRArtist *artist = [[DZRArtist alloc] initWithDictionary:artistDictionnary];
            [self.arrayItems addObject :artist];
        }
    }
    return self;
}

@end
