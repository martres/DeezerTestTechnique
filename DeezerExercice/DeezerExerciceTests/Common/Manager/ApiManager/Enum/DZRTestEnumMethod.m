//
//  DZRTestEnumMethod.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EnumHTTPMethod.h"

@interface DZRTestEnumMethod : XCTestCase

@end

@implementation DZRTestEnumMethod

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCheckStringOfEnumWorking {
    
    // Test value of the Enum
    NSString *get = HTTPMethodName[GET];
    NSString *post = HTTPMethodName[POST];
    NSString *patch = HTTPMethodName[PATCH];
    NSString *delete = HTTPMethodName[DELETE];
    NSString *put = HTTPMethodName[PUT];
    
    XCTAssertEqual(get, @"GET");
    XCTAssertEqual(post, @"POST");
    XCTAssertEqual(patch, @"PATCH");
    XCTAssertEqual(delete, @"DELETE");
    XCTAssertEqual(put, @"PUT");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
