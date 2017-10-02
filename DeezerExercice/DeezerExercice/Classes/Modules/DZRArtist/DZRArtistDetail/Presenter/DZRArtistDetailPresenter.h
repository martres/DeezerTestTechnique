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

@interface DZRArtistDetailPresenter : NSObject<DZRArtistDetailInteractorOutput, DZRArtistDetailModuleInterface>

@property (nonatomic, strong) id<DZRArtistDetailInteractorInput>            detailInteractor;
@property (nonatomic, strong) DZRArtistDetailWireframe                      *detailWireframe;
@property (nonatomic, strong) UIViewController<DZRArtistDetailInterface>    *userInterface;

@end
