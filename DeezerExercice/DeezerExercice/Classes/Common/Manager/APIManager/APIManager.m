//
//  APIManager.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (id)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

/*
 * @brief GET REQUEST
 * @params url : url of the request
 * @params completion : to get the answer
 * @discussion Simple GET Request
 */

- (void)get:(NSString *)url completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:GET dataBody:nil];
    [self startRequest:request completion:completion];
}

/*
 * @brief POST REQUEST
 * @params url : url of the request
 * @params data : data to send the post request
 * @params completion : to get the answer
 * @discussion Simple POST Request
 */

- (void)post:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion {
    NSMutableURLRequest *request = [self createRequest:url method:POST dataBody:data];
    [self startRequest:request completion:completion];
}

/*
 * @brief PUT REQUEST
 * @params url : url of the request
 * @params data : data to send the put request
 * @params completion : to get the answer
 * @discussion Simple PUT Request
 */

- (void)put:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:PUT dataBody:nil];
    [self startRequest:request completion:completion];
}

/*
 * @brief PATCH REQUEST
 * @params url : url of the request
 * @params data : data to send the patch request
 * @params completion : to get the answer
 * @discussion Simple PATCH Request
 */

- (void)patch:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:PATCH dataBody:data];
    [self startRequest:request completion:completion];
}

/*
 * @brief DELETE REQUEST
 * @params url : url of the request
 * @params data : data to send the delete request
 * @params completion : to get the answer
 * @discussion Simple DELETE Request
 */

- (void)delete:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:DELETE dataBody:data];
    [self startRequest:request completion:completion];
}

/*
 * @brief Create Request
 * @params url : url of the request
 * @params method : enum value of method for example GET
 * @params dataBody : data to send to the request
 * @discussion Create an NSMutableURLRequest with an url and a method
 */

- (NSMutableURLRequest *)createRequest:(NSString *)url method:(HTTPMethod)method dataBody:(NSData *)dataBody {
    NSMutableURLRequest *APIRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [APIRequest setHTTPMethod:HTTPMethodName[method]];
    [APIRequest setHTTPBody:dataBody];
    return APIRequest;
}

/*
 * @brief startRequest
 * @params request : request to execute
 * @params completion : completion to get the result of the request
 * @discussion function to start a request with different HTTPMethod
 */

- (void)startRequest:(NSMutableURLRequest *)request completion:(RequestCompletion)completion {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        completion(data, connectionError);
    }];
}

@end
