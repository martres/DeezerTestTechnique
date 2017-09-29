//
//  DZRArtist.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZRArtist : NSObject

@property (nonatomic, strong) NSString *artistIdentifier;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *artistPictureUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
