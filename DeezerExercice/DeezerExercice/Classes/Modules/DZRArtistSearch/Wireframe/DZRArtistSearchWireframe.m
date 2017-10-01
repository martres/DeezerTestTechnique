//
//  DZArtistSearchWireframe.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistSearchWireframe.h"
#import "DZRArtistSearchViewController.h"
#import "UIViewController+getIdentifier.h"
#import "DZRArtistSearchModuleInterface.h"
#import "DZRArtistSearchPresenter.h"
#import "DZRRootWireframe.h"

@interface DZRArtistSearchWireframe ()

@property (nonatomic, strong)  DZRArtistSearchViewController *artistSearchViewController;

@end

@implementation DZRArtistSearchWireframe

- (void)presentArtistSearchFromWindow:(UIWindow *)window {
    DZRArtistSearchViewController *searchViewController = [self artistSearchViewControllerFromStoryboard];
    searchViewController.eventHandler = (id<DZRArtistSearchModuleInterface>) self.searchPresenter;
    self.searchPresenter.userInterface = searchViewController;
    self.artistSearchViewController = searchViewController;
    [self.rootWireframe showRootViewController:searchViewController inWindow:window];
}

- (void)presentArtistDetail {
//    [self.artistDetailWireframe ]
}


/**
 @brief get the Main.Storyboard
 @return Main.Storyboard
 **/

- (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

/**
 @brief get DZRArtistSearchViewController
 @return an instance of DZRArtistSearchViewController
 **/

- (DZRArtistSearchViewController *)artistSearchViewControllerFromStoryboard {
    UIStoryboard *storyboard = [self mainStoryboard];
    NSString *identifier = [DZRArtistSearchViewController identifierStoryboard];
    DZRArtistSearchViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}



@end
