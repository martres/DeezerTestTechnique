//
//  DZRArtistSearchInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInteractorInputOuput.h"
#import "Modules.h"

@interface DZRArtistSearchInteractor : DZRBaseInteractor<DZRArtistSearchInteractorInput>

@property (nonatomic, weak) id<DZRArtistSearchInteractorOutput> output;

@end
