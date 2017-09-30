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
    self = [super initWithDictionary:dictionary];
    if (self) {
        [self setIsReadable:[[dictionary objectForKey:@"readable"] boolValue]];
        self.titleEntity = [dictionary objectForKey:@"title"];
        self.pictureUrl = [dictionary objectForKey:@"preview"];
    }
    return self;
}

@end
 
