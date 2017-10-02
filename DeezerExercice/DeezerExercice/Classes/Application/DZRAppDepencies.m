//
//  DZRAppDepencies.m
//  DeezerExercice
//
//  Created by Martreux Steven on 01/10/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchWireframe.h"
#import "DZRAppDepencies.h"
#import "DZRRootWireframe.h"
#import "DZRArtistSearchPresenter.h"
#import "DZRArtistSearchInteractor.h"
#import "Manager.h"

@interface DZRAppDepencies()

@property (nonatomic, strong) DZRArtistSearchWireframe*     artistSearchWireframe;

@end

@implementation DZRAppDepencies

- (id)init {
    self = [super init];
    if (self){
        [self configureDependencies];
    }
    return self;
}

- (void)startRootViewControllerIntoWindow:(UIWindow *)window {
    [self.artistSearchWireframe presentArtistSearchFromWindow:window];
}

- (void)configureDependencies {
    
    // Root level class
    DZRRootWireframe *rootWireframe = [[DZRRootWireframe alloc] init];
    
    // Artist Search Module Classes
    [self searchModuleInit:rootWireframe];
    
    // Artist Detail Module Classes
    
}

- (void)searchModuleInit:(DZRRootWireframe *)rootWireframe{
    DZRArtistSearchWireframe *artistSearchWireframe = [[DZRArtistSearchWireframe alloc] init];
    DZRArtistSearchPresenter *artistSearchPresent = [[DZRArtistSearchPresenter alloc] init];
    DZRArtistSearchInteractor *artistSearchInteractor = [[DZRArtistSearchInteractor alloc] initWithService:ServiceManager.sharedInstance];
    
    artistSearchPresent.artistSearchWireframe = artistSearchWireframe;
    artistSearchPresent.artistSearchInteractor = artistSearchInteractor;
    
    artistSearchInteractor.output = artistSearchPresent;
    
    artistSearchWireframe.searchPresenter = artistSearchPresent;
    artistSearchWireframe.rootWireframe = rootWireframe;
    
    self.artistSearchWireframe = artistSearchWireframe;
}

@end
