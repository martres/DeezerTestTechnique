//
//  DZRArtistSearchInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInteractorInputOuput.h"
#import "DZRArtistService.h"

@interface DZRArtistSearchInteractor : NSObject <DZRArtistSearchInteractorInput>

@property (nonatomic, weak) id<DZRArtistSearchInteractorOutput> output;

- (instancetype)initWithService:(DZRArtistService *)service;

@end
