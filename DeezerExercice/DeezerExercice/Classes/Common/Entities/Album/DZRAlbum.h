//
//  DZRAlbum.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DZRArtist;

#import "BaseEntity.h"

@interface DZRAlbum : BaseEntity

@property (nonatomic, strong) NSString *tracklitURL;
@property (nonatomic, strong) NSMutableArray *trackList;

@end
