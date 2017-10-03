//
//  BaseArrayEntity.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

/*
 * @brief BaseArrayEntity
 * @discussion Entity to handle array of BaseEntity with nextURL to get more data
 */

@interface BaseArrayEntity : NSObject

//  nextURL = string url to handle to call more data
@property (nonatomic, strong) NSString *nextURL;

//  arrayItems for example array of DZRArtist
@property (nonatomic, strong) NSMutableArray *arrayItems;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

