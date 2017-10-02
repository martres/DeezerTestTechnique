//
//  DZArtistDetailViewController.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInterface.h"

@interface DZRArtistDetailViewController : UIViewController<DZRArtistDetailInterface>

@property (nonatomic, strong) id<DZRArtistDetailInterface>        eventHandler;

@end
