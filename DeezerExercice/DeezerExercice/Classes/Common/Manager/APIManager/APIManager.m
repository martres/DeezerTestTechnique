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

- (NSMutableURLRequest *)createUrlRequestWithString:(NSString *)url {
    NSMutableURLRequest *APIRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    return APIRequest;
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
