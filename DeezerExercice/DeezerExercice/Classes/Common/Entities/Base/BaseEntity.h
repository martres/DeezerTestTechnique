//
//  BaseEntity.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@interface BaseEntity : NSObject

@property (nonatomic, strong) NSString *identifierEntity;
@property (nonatomic, strong) NSString *titleEntity;
@property (nonatomic, strong) NSString *classEntity;
@property (nonatomic, strong) NSString *pictureUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
