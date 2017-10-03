//
//  DZRArtistSearchInteractor.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInteractor.h"
#import "Modules.h"

@implementation DZRArtistSearchInteractor

/*
 * @brief initWithService super of BassInteractor
 * @params serviceManager manager to handle request from service
 * @discussion instancetype of DZRArtistSearchInteractor
 */

- (instancetype)initWithService:(ServiceManager *)serviceManager {
    self = [super initWithService:serviceManager];
    if (self) {
    }
    return self;
}

/*
 * @brief searchArtistWithName
 * @params string of the search text
 * @discussion search artist and send the result to the presenter
 */

- (void)searchArtistWithName:(NSString *)name {
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:ARTIST nameService:SEARCH_ARTIST_WITH_PARAM data:name completion:^(DZRArtistArray *artistArray, NSString *error) {
        [weak.output resultSearchArtistWithName:artistArray error:error];
    }];
}

/*
 * @brief showMoreArtistWith
 * @params artistArray to get the next url
 * @discussion show more artist with the service manager from the url of artistArray
 *             artistArray to add the artists to the old array
 *             send the result to the presenter
 */

- (void)showMoreArtistWith:(DZRArtistArray *)artistArray {
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:ARTIST nameService:MORE_ARTIST data:artistArray completion:^(DZRArtistArray *artistsMore, NSString *error) {
        DZRArtistArray *newArray = [[DZRArtistArray alloc] init];
        newArray.nextURL = artistsMore.nextURL;
        newArray.arrayItems = artistArray.arrayItems;
        [newArray.arrayItems addObjectsFromArray:artistsMore.arrayItems];
        [weak.output resultMoreArtist:newArray error:error];
    }];
}

@end
