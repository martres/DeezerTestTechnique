//
//  DZRArtistCollectionViewCell.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

@interface DZRArtistCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (class, nonatomic, assign, readonly) NSString *identifierCell;

@end
