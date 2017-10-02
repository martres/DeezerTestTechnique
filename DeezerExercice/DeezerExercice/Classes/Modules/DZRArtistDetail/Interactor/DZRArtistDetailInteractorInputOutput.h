//
//  DZRArtistDetailInteractorInputOutput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtist.h"

@protocol DZRArtistDetailInteractorInput <NSObject>

- (void)getOneAlbumAndTracks:(DZRArtist *)artist;

@end

@protocol DZRArtistDetailInteractorOutput <NSObject>

- (void)resultAlbumAndTracks:(DZRArtist *)artist error:(NSString *)error;

@end
