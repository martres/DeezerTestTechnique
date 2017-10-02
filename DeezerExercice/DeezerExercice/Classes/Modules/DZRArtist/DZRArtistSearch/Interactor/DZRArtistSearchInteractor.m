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

- (instancetype)initWithService:(ServiceManager *)serviceManager {
    self = [super initWithService:serviceManager];
    if (self) {
        self.serviceManager = serviceManager;
    }
    return self;
}

- (void)searchArtistWithName:(NSString *)name {
    __weak typeof(self) weak = self;
    [self.serviceManager callerWithEntityService:ARTIST nameService:SEARCH_ARTIST_WITH_PARAM data:name completion:^(DZRArtistArray *artistArray, NSString *error) {
        [weak.output resultSearchArtistWithName:artistArray error:error];
    }];
}

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
