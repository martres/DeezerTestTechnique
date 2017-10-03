//
//  PlayerManager.m
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "PlayerManager.h"
#import "Entities.h"

@implementation PlayerManager

+ (id)sharedInstance {
    static PlayerManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)stopSong {
    [self.player pause];
}

- (void)launchSong:(DZRTrack *)track {
    if (self.player != nil) {
        [self.player pause];
        self.player = nil;
    }
    
    self.currentTrack = track;
    
    NSURL *url = [[NSURL alloc]initWithString:track.mediaUrl];
    self.player = [[AVPlayer alloc] initWithURL:url];
    [self.player play];
}

- (NSString *)descriptionOfCurrentTrack {
    if (self.currentTrack != nil) {
        return [NSString stringWithFormat:@"Current Track: %@", self.currentTrack.titleEntity];
    } else {
        return @"No track";
    }
}

@end
