//
//  DZRTrack.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "BaseEntity.h"

@interface DZRTrack : BaseEntity

@property (nonatomic, assign) BOOL isReadable;
@property (nonatomic, strong) NSString *mediaUrl;

@end
