//
//  DZRArtistDetailPresenter.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractorInputOutput.h"
#import "DZRArtistDetailWireframe.h"

@interface DZRArtistDetailPresenter : NSObject<DZRArtistDetailInteractorOutput>

@property (nonatomic, strong) id<DZRArtistDetailInteractorInput>    detailInteractor;
@property (nonatomic, strong) DZRArtistDetailWireframe              *detailWireframe;
@property (nonatomic, strong) UIViewController                      *userInterface;

@end
