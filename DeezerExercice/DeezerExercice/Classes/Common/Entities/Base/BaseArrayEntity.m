//
//  BaseArrayEntity.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseArrayEntity.h"

@implementation BaseArrayEntity

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.nextURL = [dictionary objectForKey:@"next"];
    }
    return self;
}

@end
