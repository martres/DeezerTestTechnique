//
//  DZRArtistCollectionViewCell.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZRArtistCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (class, nonatomic, assign, readonly) NSString *identifierCell;

@end
