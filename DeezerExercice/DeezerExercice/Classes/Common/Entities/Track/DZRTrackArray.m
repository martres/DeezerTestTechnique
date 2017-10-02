//
//  DZRTrackArray.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRTrackArray.h"
#import "DZRTrack.h"

@implementation DZRTrackArray

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        NSArray *arrayTracks = [dictionary objectForKey:@"data"];
        if (arrayTracks == nil) {
            return nil;
        }
        self.arrayItems = [[NSMutableArray alloc] init];
        for (NSDictionary *artistDictionnary in arrayTracks) {
            DZRTrack *track = [[DZRTrack alloc] initWithDictionary:artistDictionnary];
            [self.arrayItems addObject:track];
        }
    }
    return self;
}

@end
