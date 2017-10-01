//
//  DZArtistSearchPresenter.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInterface.h"
#import "DZRArtistSearchWireframe.h"
#import "DZRArtistSearchInteractorInputOuput.h"
#import "DZRArtistSearchModuleInterface.h"

//DZRArtistSearchInteractorOutput : Interface to get the answer of the data
@interface DZRArtistSearchPresenter : NSObject<DZRArtistSearchInteractorOutput, DZRArtistSearchModuleInterface>

//DZRArtistSearchInteractorInput : Search Interactor Input to ask the data
@property (nonatomic, strong) id<DZRArtistSearchInteractorInput>            artistSearchInteractorInput;

//DZRArtistSearchWireframe : Router to update the view
@property (nonatomic, strong) DZRArtistSearchWireframe                      *artistSearchWireframe;

//DZRArtistSearchInterface : Reference on the current view controller
@property (nonatomic, strong) UIViewController<DZRArtistSearchInterface>    *userInterface;

@end
