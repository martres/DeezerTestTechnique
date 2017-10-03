//
//  APIManager.h
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Manager.h"

/*
 * @brief RequestCompletion
 * @params data : if the request succes
 * @params error : if the request fail
 * @discussion Completion for each kind of request
 */

typedef void(^RequestCompletion)(NSData *data, NSError *error);

/*
 * @brief APIManager Singleton
 * @discussion Singleton to manage every kind of request
 */

@interface APIManager : NSObject

+ (id)sharedInstance;

/*
 * @brief GET REQUEST
 * @params url : url of the request
 * @params completion : to get the answer
 * @discussion Simple GET Request
 */

- (void) get:(NSString *)url completion:(RequestCompletion)completion;

/*
 * @brief POST REQUEST
 * @params url : url of the request
 * @params data : data to send the post request
 * @params completion : to get the answer
 * @discussion Simple POST Request
 */

- (void) post:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;

/*
 * @brief DELETE REQUEST
 * @params url : url of the request
 * @params data : data to send the delete request
 * @params completion : to get the answer
 * @discussion Simple DELETE Request
 */

- (void) delete:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;

/*
 * @brief PATCH REQUEST
 * @params url : url of the request
 * @params data : data to send the patch request
 * @params completion : to get the answer
 * @discussion Simple PATCH Request
 */

- (void) patch:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;

/*
 * @brief PUT REQUEST
 * @params url : url of the request
 * @params data : data to send the put request
 * @params completion : to get the answer
 * @discussion Simple PUT Request
 */

- (void) put:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion;

@end
