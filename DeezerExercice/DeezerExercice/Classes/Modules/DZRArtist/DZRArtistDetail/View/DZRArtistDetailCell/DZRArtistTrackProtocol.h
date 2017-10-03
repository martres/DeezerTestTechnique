//
//  DZRArtistTrackIProtocol.h
//  DeezerExercice
//
//  Created by Martreux Steven on 03/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief DZRArtistTrackProtocol
 * protocol to handle to start and stop song at index
 */

@protocol DZRArtistTrackProtocol

- (void)startSongAtIndex:(NSInteger)index;

- (void)stopSongAtIndex:(NSInteger)index;

@end
