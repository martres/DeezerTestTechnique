//
//  DZArtistSearchPresenter.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInterface.h"
#import "DZRArtistSearchWireframe.h"


@interface DZRArtistSearchPresenter : NSObject


@property (nonatomic, strong) id<
@property (nonatomic, strong) DZRArtistSearchWireframe *artistSearchWireframe;
@property (nonatomic, strong) UIViewController<DZRArtistSearchInterface> *userInterface;

@end
