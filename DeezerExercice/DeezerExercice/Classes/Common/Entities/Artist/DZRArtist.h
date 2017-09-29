//
//  DZRArtist.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"
#import "DZRAlbum.h"

@interface DZRArtist : BaseEntity

@property (nonatomic, strong) DZRAlbum *artistAlbum;

@end
