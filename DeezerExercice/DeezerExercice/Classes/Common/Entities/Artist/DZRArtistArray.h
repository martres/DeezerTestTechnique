//
//  DZRArtistArray.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZRArtistArray : NSObject

@property (nonatomic, strong) NSString *nextURL;
@property (nonatomic, strong) NSMutableArray *artists;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
