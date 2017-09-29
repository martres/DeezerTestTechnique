//
//  APIManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestCompletion)(NSData *data, NSError *error);

@interface APIManager : NSObject

+ (id)sharedInstance;

- (void) get:(NSString *)url completion:(RequestCompletion)completion;
- (void) post:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;
- (void) delete:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;
- (void) patch:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;
- (void) put:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;

@end
