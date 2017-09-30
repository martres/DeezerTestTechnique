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
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:
     ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         completion(data, error);
     }];
    [dataTask resume];
}


//    NSString *urlRequest = [NSString stringWithFormat:@"http://api.deezer.com/search/artist?q=%@", name];
//    NSURLRequest *APIRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlRequest]];
//
//    [NSURLConnection sendAsynchronousRequest:APIRequest
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                               if (connectionError) {
//                                   // TODO
//                               }
//                               else {
//                                   NSDictionary *retData = [NSJSONSerialization JSONObjectWithData:data
//                                                                                           options:kNilOptions
//                                                                                             error:&connectionError];
//                                   NSLog(@"%@", [retData objectForKey:@"data"]);
//                                   self.artists = [retData objectForKey:@"data"];
//                                   [self.collectionView reloadData];
//                               }
//                           }];



@end
