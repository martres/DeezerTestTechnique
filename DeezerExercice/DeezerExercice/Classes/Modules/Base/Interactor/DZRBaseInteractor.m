//
//  DZRBaseInteractor.m
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRBaseInteractor.h"

@implementation DZRBaseInteractor

/*
 * @brief initWithService
 * @params serviceManager : Manager to handle every service
 * @discussion instance of an interactor with a service manager to handle request
 */

- (instancetype)initWithService:(id)serviceManager {
    self = [super init];
    if (self) {
        self.serviceManager = serviceManager;
    }
    return self;
}

@end
