//
//  DZArtistSearchModuleInterface.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@class DZRArtist;

/**
 @protocol DZRArtistSearchModuleInterface
 @brief DZRArtistSearchModuleInterface procotol, Event Handler of the ArtistSearch module
 @param searchArtistWithName: call this method if you want to search artist with a name in param
 **/

@protocol DZRArtistSearchModuleInterface <NSObject>


/**
 @brief research of artists of Deezer
 @param textSearch NSString from the SearchBar
 **/

- (void)searchArtistWithName:(NSString *)textSearch;

/**
 @brief Show the detail of an artist
 @param an Artist (DZRArtist)
 **/

- (void)showDetailOfArtist:(DZRArtist *)artist;

/**
 @brief Show more Artist
 @param DZArtistArray
 **/

- (void)showMoreArtists:(DZRArtistArray *)artistarray;

@end
