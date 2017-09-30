//
//  TestDZArtistService.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DZRArtistService.h"
#import "DZRAlbumService.h"
#import "DZRTrackService.h"
#import "DZRArtist.h"

#import "URLManager.h"

static DZRArtistArray *artistArrayTMP;
static DZRArtist *arstistTmp;

@interface TestDZArtistService : XCTestCase

@end

@implementation TestDZArtistService

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArtistsRequest {
    DZRArtistService *service = [[DZRArtistService alloc] init];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [service searchArtists:@"t" completion:^(DZRArtistArray *artistArray, NSString *error) {
        XCTAssertNil(error, @"completion error %@", error);
        XCTAssert(artistArray, @"data is nil");
        artistArrayTMP = artistArray;
        XCTAssertNotNil(artistArray.arrayItems[0], @"No results artists");
        arstistTmp = artistArray.arrayItems[0];
        [self artistCheckData];
        [self getOneAlbum];
        
        dispatch_semaphore_signal(semaphore);
    }];
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");
}

- (void)getOneAlbum{
    DZRAlbumService *service = [[DZRAlbumService alloc] init];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [service getOneAlbum:arstistTmp.identifierEntity completion:^(DZRAlbum *album, NSString *error) {
        XCTAssertNil(error, @"completion error %@", error);
        XCTAssert(album, @"data is nil");
        arstistTmp.artistAlbum = album;
        [self artistAlbumCheckData];
        [self getTracksAlbum];
        dispatch_semaphore_signal(semaphore);

    }];

    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");
}

- (void)getTracksAlbum {
    DZRTrackService *service = [[DZRTrackService alloc] init];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [service getTracksFromAlbum:arstistTmp.artistAlbum.identifierEntity completion:^(DZRTrackArray *tracks, NSString *error) {
        XCTAssertNil(error, @"completion error %@", error);
        XCTAssert(tracks, @"data is nil");
        arstistTmp.artistAlbum.trackList = tracks;
        
        [self checkTracksInAlbum];
        dispatch_semaphore_signal(semaphore);

    }];
    
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");
}

- (void) artistAlbumCheckData {
    if (arstistTmp == nil) {
        XCTAssert(arstistTmp, @"data is nil");
        return;
    }
    
    XCTAssertNotNil(arstistTmp.identifierEntity, "Identifier is nil");
    XCTAssertNotNil(arstistTmp.artistAlbum, "Artist Album is nil");
    XCTAssertNotNil(arstistTmp.titleEntity, "Title Entity is nil");
}

- (void) checkTracksInAlbum {
    XCTAssert(arstistTmp.artistAlbum.trackList, @"data is nil");
    
    for (DZRArtist *artist in arstistTmp.artistAlbum.trackList.arrayItems) {
        XCTAssertNotNil(artist.titleEntity, "NAME ARTIST is nil");
        XCTAssertNotNil(artist.pictureUrl, "PICTURE URL is nil");
        XCTAssertNotNil(artist.identifierEntity, "IDENTIFIER is nil");
    }
}

- (void) artistCheckData {
    if (artistArrayTMP == nil) {
        XCTAssert(artistArrayTMP, @"data is nil");
        return;
    }
    XCTAssertNotNil(artistArrayTMP.nextURL, "Next URL is nil");
    XCTAssertNotNil(artistArrayTMP.arrayItems, "Next URL is nil");
    
    for (DZRArtist *artist in artistArrayTMP.arrayItems) {
        XCTAssertNotNil(artist.titleEntity, "NAME ARTIST is nil");
        XCTAssertNotNil(artist.pictureUrl, "PICTURE URL is nil");
        XCTAssertNotNil(artist.identifierEntity, "IDENTIFIER is nil");
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
