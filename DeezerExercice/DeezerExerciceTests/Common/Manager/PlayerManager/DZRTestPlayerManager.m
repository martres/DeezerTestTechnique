//
//  DZRTestPlayerManager.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 04/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Manager.h"
#import "Entities.h"

@interface DZRTestPlayerManager : XCTestCase

@end

@implementation DZRTestPlayerManager

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPlayerManager {
    
    DZRTrack *track = [[DZRTrack alloc] init];
    track.mediaUrl = @"https://e-cdns-preview-5.dzcdn.net/stream/51afcde9f56a132096c0496cc95eb24b-4.mp3";
    [[PlayerManager sharedInstance] launchSong:track];
    BOOL isPlaying = [[PlayerManager sharedInstance] player ].rate != 0;
    XCTAssertTrue(isPlaying, "Player is not playing");
    [[PlayerManager sharedInstance] stopSong];
    BOOL isStopping = [[PlayerManager sharedInstance] player ] == nil;
    XCTAssertTrue(isStopping, "Player is not null");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
