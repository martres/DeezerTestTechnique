//
//  DZRArtistDetailInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractorInputOutput.h"
#import "Modules.h"

/*
 * @brief DZRArtistDetailInteractor class of base Interactor
 * @protocols DZRArtistDetailInteractorInput input call by the presenter
 * @discussion class to handle the interactor for making request and to play a song for the module artist detail
 */

@interface DZRArtistDetailInteractor : DZRBaseInteractor<DZRArtistDetailInteractorInput>

//  DZRArtistDetailInteractorOutput to call function from the presenter
@property (nonatomic, weak) id<DZRArtistDetailInteractorOutput> output;

/*
 * @brief initWithService
 * @params serviceManager manager to handle request from service
 * @params playerManager manager to handle to play song from DZRTrack
 * @discussion instancetype of DZRArtistDetailInteractor
 */

- (instancetype)initWithService:(ServiceManager *)serviceManager playerManager:(PlayerManager *)playerManager;

@end
