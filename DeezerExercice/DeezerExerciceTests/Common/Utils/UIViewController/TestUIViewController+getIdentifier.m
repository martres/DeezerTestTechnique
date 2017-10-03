//
//  TestUIViewController+getIdentifier.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DZRArtistSearchViewController.h"
#import "Utils.h"

@interface TestUIViewController_getIdentifier : XCTestCase

@end

@implementation TestUIViewController_getIdentifier

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetIdentifierViewController {
    NSString *identifier = [DZRArtistSearchViewController identifierStoryboard];
    
    XCTAssertTrue([identifier isEqualToString:@"DZRArtistSearchViewController"], @"identifier Storyboard fail");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
