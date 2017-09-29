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

@implementation DZRArtistSearchWireframe

- (void)presentArtistSearchFromWindow:(UIWindow *)window {
    DZRArtistSearchViewController *searchViewController = [self artistSearchViewControllerFromStoryboard];
    
//    self.searchPresenter
}

- (void)presentArtistDetail {
//    [self.artistDetailWireframe ]
}


/**
 @brief get the Main.Storyboard
 @return Main.Storyboard
 **/

- (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
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
