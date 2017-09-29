//
//  TestDZArtistService.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DZRArtistService.h"
#import "URLManager.h"

@interface TestDZArtistService : XCTestCase

@property (nonatomic, assign) NSString *error;
@property (nonatomic, assign) DZRArtistArray *artistArray;

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
    
    NSString *url = [URLManager urlForSearchArtistsWithName:@"t"];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [service getArtists:url completion:^(DZRArtistArray *artistArray, NSString *error) {
        self.error = error;
        self.artistArray = artistArray;
        dispatch_semaphore_signal(semaphore);
    }];
    long time = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC));
    XCTAssertEqual(time, 0, @"network request timed out");

}

-(void)testError {
    XCTAssertNil(self.error, @"completion error %@", self.error);
}

- (void)testData {
    XCTAssert(self.artistArray, @"data is nil");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
