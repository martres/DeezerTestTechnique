//
//  DZRArtistDetailInteractor.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailInteractorInputOutput.h"
#import "DZRAlbumService.h"
#import "DZRTrackService.h"

@interface DZRArtistDetailInteractor : NSObject<DZRArtistDetailInteractorInput>

@property (nonatomic, weak) id<DZRArtistDetailInteractorOutput> output;

- (instancetype)initWithService:(DZRAlbumService *)serviceAlbum serviceTrack:(DZRTrackService *)serviceTrack;

@end
