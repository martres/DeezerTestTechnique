//
//  EnumEndPoint.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

typedef enum EndPoint: NSInteger {
    SEARCH_ARTIST,
    GET_ONE_ALBUM_ARTIST,
    GET_TRACKS_ALBUM,
} EndPoint;

static NSString * EndPointName[] = {
    @"search/artist?q=%@",
    @"artist/%@/albums",
    @"album/%@/tracks",
};
