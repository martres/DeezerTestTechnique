//
//  DZRArtistCollectionViewCell.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "Modules.h"

@interface DZRArtistCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet ImageViewLoad *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UIView *container;

//get nib of the cell DZRArtistCollectionViewCell
+(UINib *) getNibOfCell;

//get identifier of the cell DZRArtistCollectionViewCell
+(NSString *)getIdentifier;

@end
