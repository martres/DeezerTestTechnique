//
//  DZRArtist.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "BaseEntity.h"
#import "DZRAlbum.h"

/*
 * @brief DZRArtist
 * @discussion Entity to handle an artist of Deezer
 */

@interface DZRArtist : BaseEntity

//  artistAlbum = reference of one album of the artist
@property (nonatomic, strong) DZRAlbum *artistAlbum;

@end
