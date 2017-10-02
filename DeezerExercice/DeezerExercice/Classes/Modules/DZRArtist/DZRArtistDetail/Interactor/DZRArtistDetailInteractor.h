//
//  DZRArtistDetailInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractorInputOutput.h"
#import "Modules.h"

@interface DZRArtistDetailInteractor : DZRBaseInteractor<DZRArtistDetailInteractorInput>

@property (nonatomic, weak) id<DZRArtistDetailInteractorOutput> output;

@end
