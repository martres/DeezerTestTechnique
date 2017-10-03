//
//  DZRTestServiceManager.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 04/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ServiceManager.h"
#import "Entities.h"

@interface DZRTestServiceManager : XCTestCase

@property (nonatomic, strong) DZRArtistArray *arrayArtists;

@end

@implementation DZRTestServiceManager

- (void)setUp {
    [super setUp];
    self.arrayArtists =[[DZRArtistArray alloc] init];
    self.arrayArtists.nextURL = @"https://api.deezer.com/search?q=eminem&index=25";
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArtistSearch {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[ServiceManager sharedInstance] callerWithEntityService:ARTIST nameService:SEARCH_ARTIST_WITH_PARAM data:@"d" completion:^(DZRArtistArray *artistArray, NSString *error) {
        XCTAssertNil(error, @"Error is not nil");
        XCTAssert(artistArray, @"artistArray is nil");
        XCTAssert(artistArray.arrayItems.count == 25, @"Artist array check the number of item");
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");

}

- (void)testArtistMore {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[ServiceManager sharedInstance] callerWithEntityService:ARTIST nameService:MORE_ARTIST data:self.arrayArtists completion:^(DZRArtistArray *artistArray, NSString *error) {
        XCTAssertNil(error, @"Error is not nil");
        XCTAssert(artistArray, @"artistArray is nil");
        XCTAssert(artistArray.arrayItems.count == 25, @"Artist array check the number of item");
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");
    
}

- (void)testGetOneAlbum {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[ServiceManager sharedInstance] callerWithEntityService:ALBUM nameService:GET_ONE_ALBUM data:@"13" completion:^(DZRAlbum *album, NSString *error) {
        XCTAssertNil(error, @"Error is not nil");
        XCTAssert(album, @"Album is nil");
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");
    
}

- (void)testGetTrackForAlbum {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[ServiceManager sharedInstance] callerWithEntityService:TRACK nameService:GET_TRACKS_OF_ALBUM data:@"302127" completion:^(DZRAlbum *album, NSString *error) {
        XCTAssertNil(error, @"Error is not nil");
        XCTAssert(album, @"Album is nil");
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
