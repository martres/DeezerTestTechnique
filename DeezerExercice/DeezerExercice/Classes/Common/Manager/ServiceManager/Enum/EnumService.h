//
//  EnumService.h
//  DeezerExercice
//
//  Created by Martreux Steven on 02/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

typedef enum EntityService: NSInteger {
    ARTIST,
    ALBUM,
    TRACK,
} EntityService;

typedef enum NameService: NSInteger {
    SEARCH_ARTIST_WITH_PARAM,
    MORE_ARTIST,
    GET_ONE_ALBUM,
    GET_TRACKS_OF_ALBUM
} NameService;

