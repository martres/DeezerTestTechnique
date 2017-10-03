//
//  DZRArtistSearchInteractorInputOuput.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Modules.h"

/*
 * @brief DZRArtistSearchInteractorInput
 * @discussion Protocol for the interactor called by the presenter
 */

@protocol DZRArtistSearchInteractorInput <NSObject>

/*
 * @brief searchArtistWithName
 * @params string of the search text
 * @discussion search artist and send the result to the presenter
 */

- (void)searchArtistWithName:(NSString *)name;

/*
 * @brief showMoreArtistWith
 * @params artistArray to get the next url
 * @discussion show more artist with the service manager from the url of artistArray
 *             artistArray to add the artists to the old array
 *             send the result to the presenter
 */

- (void)showMoreArtistWith:(DZRArtistArray *)artistArray;

@end

/*
 * @brief DZRArtistDetailInteractorInput
 * @discussion Protocol for the presenter called by the interactor
 */

@protocol DZRArtistSearchInteractorOutput <NSObject>

/*
 * @brief resultSearchArtistWithName
 * @params DZRArtistArray array of artists result of the request search
 * @params error string if the request failed
 * @discussion get the results of artists search
 */

- (void)resultSearchArtistWithName:(DZRArtistArray *)artistArray error:(NSString *)error;

/*
 * @brief resultMoreArtist
 * @params DZRArtistArray array of all artists with the same search
 * @params error string if the request failed
 * @discussion get the results of more artist
 */

- (void)resultMoreArtist:(DZRArtistArray *)artistArray error:(NSString *)error;

@end

