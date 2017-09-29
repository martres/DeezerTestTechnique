//
//  DZRArtistSearchInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @protocol DZRArtistSearchInterface
 @brief DRZArtistInterface procotol
 @param searchArtist with NSString in param to handle the research of Artist
 **/

@protocol DZRArtistSearchInterface <NSObject>

/**
 @brief research of artists of Deezer
 @param textSearch NSString from the SearchBar
 **/

- (void)searchArtistWithName:(NSString *)textSearch;

@end
