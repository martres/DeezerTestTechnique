//
//  TestDZArtistService.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DZRArtistService.h"
#import "DZRArtist.h"
#import "URLManager.h"

static DZRArtistArray *artistTMP;

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
    NSString *url = [URLManager urlDeezerBuilder:@"t" endPoint:SEARCH_ARTIST];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [service searchArtists:url completion:^(DZRArtistArray *artistArray, NSString *error) {
        XCTAssertNil(error, @"completion error %@", error);
        XCTAssert(artistArray, @"data is nil");
         artistTMP = artistArray;
        dispatch_semaphore_signal(semaphore);
    }];
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");

}

- (void) testCheckData {
    if (artistTMP == nil) {
        XCTAssert(artistTMP, @"data is nil");
        return;
    }
    XCTAssertNotNil(artistTMP.nextURL, "Next URL is nil");
    XCTAssertNotNil(artistTMP.artists, "Next URL is nil");
    
    for (DZRArtist *artist in artistTMP.artists) {
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
