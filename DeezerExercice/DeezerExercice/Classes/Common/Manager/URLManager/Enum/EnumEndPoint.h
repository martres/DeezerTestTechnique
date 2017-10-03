//
//  EnumEndPoint.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief EndPoint
 * @discussion Enum for each kind of end point
 */

typedef enum EndPoint: NSInteger {
    SEARCH_ARTIST,
    GET_ONE_ALBUM_ARTIST,
    GET_TRACKS_ALBUM,
} EndPoint;

/*
 * @brief EndPoint
 * @discussion array to get the end point to string
 */

static NSString * EndPointName[] = {
    @"search/artist?q=%@",
    @"artist/%@/albums",
    @"album/%@/tracks",
};
