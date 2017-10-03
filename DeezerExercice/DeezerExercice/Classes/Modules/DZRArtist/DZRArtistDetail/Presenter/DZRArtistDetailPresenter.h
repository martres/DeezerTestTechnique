//
//  DZRArtistDetailPresenter.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractorInputOutput.h"
#import "DZRArtistDetailWireframe.h"
#import "DZRArtistDetailInterface.h"
#import "DZRArtistDetailModuleInterface.h"

/*
 * @brief DZRArtistDetailPresenter
 * Presenter of the artist detail module
 */

@interface DZRArtistDetailPresenter : NSObject<DZRArtistDetailInteractorOutput, DZRArtistDetailModuleInterface>

//  detailInteractor : to get data for example
@property (nonatomic, strong) id<DZRArtistDetailInteractorInput>            detailInteractor;

//  detailWireframe : to change state of the current viewcontroller
@property (nonatomic, strong) DZRArtistDetailWireframe                      *detailWireframe;

//  userInterface : reference of the current view controller
@property (nonatomic, strong) UIViewController<DZRArtistDetailInterface>    *userInterface;

@end
