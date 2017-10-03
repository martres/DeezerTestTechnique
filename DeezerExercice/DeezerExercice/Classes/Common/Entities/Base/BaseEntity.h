//
//  BaseEntity.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@interface BaseEntity : NSObject

// identifierEntity = ID of the object from Deezer
@property (nonatomic, strong) NSString *identifierEntity;

// titleEntity = name of the entity for example the name of the artist
@property (nonatomic, strong) NSString *titleEntity;

// classEntity = name of the entity from deezer for example : track
@property (nonatomic, strong) NSString *classEntity;

// pictureURL = url of the picture entity
@property (nonatomic, strong) NSString *pictureUrl;

/*
 * @brief InitWithDictionary the base entity
 * @params Dictionary of the data
 * @discussion instance of Base entity to handle the data
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
