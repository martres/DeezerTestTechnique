//
//  TestUIViewExtension.m
//  DeezerExerciceTests
//
//  Created by Martreux Steven on 04/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Utils.h"

@interface TestUIViewExtension : XCTestCase

@end

@implementation TestUIViewExtension

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUIViewExtension {
    UIView *view = [[UIView alloc] init];
    [view rounded:25];
    XCTAssertTrue(view.layer.cornerRadius == 25, "View extension not equalts to 25");
    [view roundedWithColor:[UIColor redColor] borderSize:2 radius:24];
    XCTAssertTrue(view.layer.cornerRadius == 24, "View extension not equalts to 25");
    XCTAssertTrue(view.layer.borderColor == [UIColor redColor].CGColor, "View extension not equalts to RED");
    XCTAssertTrue(view.layer.borderWidth == 2, "View extension not equalts to WIDTH");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
