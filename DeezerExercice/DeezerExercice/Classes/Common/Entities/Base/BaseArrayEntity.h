//
//  BaseArrayEntity.h
//  DeezerExercice
//
//  Created by Martreux Steven on 30/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

@interface BaseArrayEntity : NSObject

@property (nonatomic, strong) NSString *nextURL;
@property (nonatomic, strong) NSMutableArray *arrayItems;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

