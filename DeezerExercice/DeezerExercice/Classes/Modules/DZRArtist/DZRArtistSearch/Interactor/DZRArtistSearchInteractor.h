//
//  DZRArtistSearchInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInteractorInputOuput.h"
#import "Modules.h"

/*
 * @brief DZRArtistSearchInteractor class of base Interactor
 * @protocols DZRArtistSearchInteractorInput input call by the presenter
 * @discussion class to handle the interactor for making request for the module artist search
 */

@interface DZRArtistSearchInteractor : DZRBaseInteractor<DZRArtistSearchInteractorInput>

//  DZRArtistSearchInteractorOutput to call function from the presenter
@property (nonatomic, weak) id<DZRArtistSearchInteractorOutput> output;

@end
