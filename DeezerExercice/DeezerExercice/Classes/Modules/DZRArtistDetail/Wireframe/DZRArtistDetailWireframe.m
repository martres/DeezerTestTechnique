//
//  DZArtistDetailWireframe.m
//  DeezerExercice
//
//  Created by Martreux Steven on 28/09/2017.
//  Copyright © 2017 Deezer. All rights reserved.
//

#import "DZRArtistDetailWireframe.h"
#import "DZRArtistDetailViewController.h"
#import "UIViewController+getIdentifier.h"

@interface DZRArtistDetailWireframe()

@property (nonatomic, strong) UIViewController *presentedViewController;

@end

@implementation DZRArtistDetailWireframe

- (void) presentArtistDetailFromViewController:(UIViewController *)viewController detailArtist:(DZRArtist *)detailArtist {
    
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
