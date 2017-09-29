//
//  TestURLManager.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "URLManager.h"

@interface TestURLManager : XCTestCase

@end

@implementation TestURLManager

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUrlSearchArtist {
    NSString *urlSearchArtist = [URLManager urlForSearchArtistsWithName:@"test"];
    
    XCTAssertTrue([urlSearchArtist isEqualToString:@"http://api.deezer.com/search/artist?q=test"], "URL MANAGER URL FOR SEARCH ARTIST FAIL");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
