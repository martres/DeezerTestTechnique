//
//  DZRAlbum.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZRArtist.h"
#import "BaseEntity.h"

@interface DZRAlbum : BaseEntity

@property (nonatomic, strong) NSString *albumCoverURL;
@property (nonatomic, strong) NSString *tracklitURL;

@end
