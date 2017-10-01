//
//  DZRArtistSearchInteractorInputOuput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistArray.h"

@protocol DZRArtistSearchInteractorInput <NSObject>

- (void)searchArtistWithName:(NSString *)name;

@end

@protocol DZRArtistSearchInteractorOutput <NSObject>

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error;

@end

