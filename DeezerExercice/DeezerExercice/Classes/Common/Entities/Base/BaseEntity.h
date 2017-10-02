//
//  BaseEntity.h
//  DeezerExercice
//
//  Created by Martreux Steven on 29/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseEntity : NSObject

@property (nonatomic, strong) NSString *identifierEntity;
@property (nonatomic, strong) NSString *titleEntity;
@property (nonatomic, strong) NSString *classEntity;
@property (nonatomic, strong) NSString *pictureUrl;
@property (nonatomic, strong) UIImage  *pictureCache;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
