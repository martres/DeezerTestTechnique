//
//  DZRArtistSearchInteractor.m
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchInteractor.h"
#import "DZRArtist.h"

@interface DZRArtistSearchInteractor()

@property (nonatomic, strong) DZRArtistService *service;

@end

@implementation DZRArtistSearchInteractor

- (instancetype)initWithService:(DZRArtistService *)service {
    self = [super init];
    if (self) {
        self.service = service;
    }
    return self;
}

- (void)searchArtistWithName:(NSString *)name {
    __weak typeof(self) weak = self;
    [self.service searchArtists:name completion:^(DZRArtistArray *artistArray, NSString *error) {
        [weak.output resultSearchArtistWithName:artistArray error:error];
    }];
}

- (void)showMoreArtistWith:(DZRArtistArray *)artistArray {
    __weak typeof(self) weak = self;
    [self.service moreArtists:artistArray completion:^(DZRArtistArray *artistsMore, NSString *error) {
        DZRArtistArray *newArray = [[DZRArtistArray alloc] init];
        newArray.nextURL = artistsMore.nextURL;
        newArray.arrayItems = artistArray.arrayItems;
        [newArray.arrayItems addObjectsFromArray:artistsMore.arrayItems];
        [weak.output resultMoreArtist:newArray error:error];
    }];
}

@end
