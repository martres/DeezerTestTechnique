//
//  DZRTrack.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRTrack.h"

@implementation DZRTrack

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.
        self.pictureUrl = [dictionary objectForKey:@"preview"];
    }
}

@end
