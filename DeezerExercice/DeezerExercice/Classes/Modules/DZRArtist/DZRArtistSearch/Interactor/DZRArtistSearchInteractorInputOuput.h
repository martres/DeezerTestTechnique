//
//  DZRArtistSearchInteractorInputOuput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

@protocol DZRArtistSearchInteractorInput <NSObject>

- (void)searchArtistWithName:(NSString *)name;

- (void)showMoreArtistWith:(DZRArtistArray *)artistArray;

@end

@protocol DZRArtistSearchInteractorOutput <NSObject>

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error;

- (void)resultMoreArtist:(DZRArtistArray *)artistArray error:(NSString *)error;

@end

