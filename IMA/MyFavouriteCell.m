//
//  MyFavouriteCell.m
//  IMA
//
//  Created by Mobytz on 02/01/2013.
//
//

#import "MyFavouriteCell.h"

@implementation MyFavouriteCell
@synthesize lblDate,lblUserName,lblStatus,imgProfilePic,imgBottomShape,imgTriangle,imgRightShape;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
