//
//  DZRArtistCollectionViewCell.h
//  DeezerExercice
//  Copyright (c) 2015 Deezer. All rights reserved.
//

#import "UIImageView+LoadImage.h"

@interface DZRArtistCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UIView *container;

+(UINib *) getNibOfCell;
+(NSString *)getIdentifier;

-(void) loadImageArtist:(NSString *)url indexPath:(NSIndexPath *)indexPath completion:(void(^)(UIImage *image, NSIndexPath *indexPath))completion;

@end
