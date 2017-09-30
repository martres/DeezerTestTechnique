//
//  APIManager.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "APIManager.h"
#import "EnumHTTPMethod.h"

@implementation APIManager

+ (id)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)get:(NSString *)url completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:GET dataBody:nil];
    [self startRequest:request completion:completion];
}

- (void)post:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion {
    NSMutableURLRequest *request = [self createRequest:url method:POST dataBody:data];
    [self startRequest:request completion:completion];
}

- (void)put:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:PUT dataBody:nil];
    [self startRequest:request completion:completion];
}

- (void)patch:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:PATCH dataBody:data];
    [self startRequest:request completion:completion];
}

- (void)delete:(NSString *)url data:(NSData *)data completion:(RequestCompletion)completion  {
    NSMutableURLRequest *request = [self createRequest:url method:DELETE dataBody:data];
    [self startRequest:request completion:completion];
}

- (NSMutableURLRequest *)createRequest:(NSString *)url method:(HTTPMethod)method dataBody:(NSData *)dataBody {
    NSMutableURLRequest *APIRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [APIRequest setHTTPMethod:HTTPMethodName[method]];
    [APIRequest setHTTPBody:dataBody];
    return APIRequest;
}

- (void)startRequest:(NSMutableURLRequest *)request completion:(RequestCompletion)completion {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        completion(data, connectionError);
    }];
}

@end
