//
//  DZRBaseInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Manager.h"

@interface DZRBaseInteractor : NSObject

- (instancetype)initWithService:(ServiceManager *)serviceManager;

@property (nonatomic, strong) ServiceManager *serviceManager;

@end
