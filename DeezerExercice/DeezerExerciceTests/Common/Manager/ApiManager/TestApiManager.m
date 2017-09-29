//
//  TestApiManager.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APIManager.h"

@interface TestApiManager : XCTestCase

@end

@implementation TestApiManager

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetRequest {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[APIManager sharedInstance] get:@"https://www.apple.fr" completion:^(NSData *data, NSError *error) {
        XCTAssertNil(error, @"completion error %@", error);
        XCTAssert(data, @"data is nil");
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
