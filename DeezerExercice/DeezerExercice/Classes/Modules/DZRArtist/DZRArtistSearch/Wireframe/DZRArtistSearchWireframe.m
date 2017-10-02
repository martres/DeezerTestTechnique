//
//  DZArtistSearchWireframe.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "Utils.h"
#import "DZRArtistDetailWireframe.h"
#import "DZRArtistSearchWireframe.h"
#import "DZRArtistSearchViewController.h"
#import "DZRArtistSearchModuleInterface.h"
#import "DZRArtistSearchPresenter.h"
#import "DZRRootWireframe.h"

@interface DZRArtistSearchWireframe ()

@property (nonatomic, strong)  DZRArtistSearchViewController *artistSearchViewController;

@end

@implementation DZRArtistSearchWireframe

/**
 @brief     the main view controller of the module Search
 @params    the current window of the application
 **/


- (void)presentArtistSearchFromWindow:(UIWindow *)window {
    DZRArtistSearchViewController *searchViewController = [self artistSearchViewControllerFromStoryboard];
    searchViewController.eventHandler = (id<DZRArtistSearchModuleInterface>) self.searchPresenter;
    self.searchPresenter.userInterface = searchViewController;
    self.artistSearchViewController = searchViewController;
    [self.rootWireframe showRootViewController:searchViewController inWindow:window];
}

/**
 @brief     presentArtist Detail change the current viewcontroller to show the detail of an artist
 @params    DZRArtist to send the data to the next module
 **/

- (void)presentArtistDetail:(DZRArtist *)artist {
    [self.artistDetailWireframe presentArtistDetailFromViewController:_artistSearchViewController detailArtist:artist];
}

/**
 @brief     get the Main.Storyboard
 @return    Main.Storyboard
 **/

- (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

/**
 @brief     get DZRArtistSearchViewController
 @return    an instance of DZRArtistSearchViewController
 **/

- (DZRArtistSearchViewController *)artistSearchViewControllerFromStoryboard {
    UIStoryboard *storyboard = [self mainStoryboard];
    NSString *identifier = [DZRArtistSearchViewController identifierStoryboard];
    DZRArtistSearchViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}



@end
