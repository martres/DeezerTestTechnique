//
//  BaseEntity.m
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Entities.h"

@implementation BaseEntity

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.identifierEntity = [dictionary objectForKey:@"id"];
        self.classEntity = [dictionary objectForKey:@"type"];
    }
    return self;
}

@end
