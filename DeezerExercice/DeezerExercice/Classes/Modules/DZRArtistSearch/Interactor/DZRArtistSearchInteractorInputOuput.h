//
//  DZRArtistSearchInteractorInputOuput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistArray.h"

@protocol DZRArtistSearchInteractorInput <NSOjbect>

- (void)searchArtistWithName:(NSString *)name;

@end

@protocol DZRArtistSearchInteractorOutput <NSOjbect>

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error;

@end

