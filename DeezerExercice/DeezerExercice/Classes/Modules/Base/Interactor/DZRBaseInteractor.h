//
//  DZRBaseInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Manager.h"

/*
 * @brief DZRBaseInteractor
 * @discussion class abstract for every interactor of a module
 */

@interface DZRBaseInteractor : NSObject

/*
 * @brief initWithService
 * @params serviceManager : Manager to handle every service
 * @discussion instance of an interactor with a service manager to handle request
 */

- (instancetype)initWithService:(ServiceManager *)serviceManager;


// serviceManager : Manager to handle every service
@property (nonatomic, strong) ServiceManager *serviceManager;

@end
