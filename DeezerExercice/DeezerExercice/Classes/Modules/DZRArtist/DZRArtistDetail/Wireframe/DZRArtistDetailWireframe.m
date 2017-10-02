//
//  DZArtistDetailWireframe.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailWireframe.h"
#import "DZRArtistDetailViewController.h"
#import "DZRArtistDetailPresenter.h"
#import "DZRArtistDetailInteractor.h"
#import "DZRArtistDetailInteractorInputOutput.h"

@interface DZRArtistDetailWireframe()

@property (nonatomic, strong) UIViewController *presentedViewController;
@property (nonatomic, strong) DZRRootWireframe *rootWireframe;

@end

@implementation DZRArtistDetailWireframe

- (void) presentArtistDetailFromViewController:(UIViewController *)viewController detailArtist:(DZRArtist *)detailArtist rootWireframe:(DZRRootWireframe *)rootWireframe {
    DZRArtistDetailViewController *controller = [self detailViewController];
    DZRArtistDetailPresenter *presenter = [[DZRArtistDetailPresenter alloc] init];
    DZRArtistDetailInteractor *interactor = [[DZRArtistDetailInteractor alloc] initWithService:ServiceManager.sharedInstance];
    
    presenter.detailInteractor = interactor;
    presenter.userInterface = controller;
    presenter.detailWireframe = self;
    
    controller.eventHandler = (id<DZRArtistDetailModuleInterface>) presenter;
    controller.artist = detailArtist;
    
    self.rootWireframe = rootWireframe;
    [self.rootWireframe pushViewController:controller animated:true];
}

- (void)dismissArtistDetail {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (UIStoryboard *) artistDetailStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ArtistDetailStoryboard" bundle:[NSBundle mainBundle]];
    return storyboard;
}

- (DZRArtistDetailViewController *)detailViewController {
    UIStoryboard *storyboard = [self artistDetailStoryboard];
    DZRArtistDetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:DZRArtistDetailViewController.identifierStoryboard];
    return detailViewController;
}

@end
