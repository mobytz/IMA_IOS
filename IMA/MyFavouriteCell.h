//
//  MyFavouriteCell.h
//  IMA
//
//  Created by Mobytz on 02/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface MyFavouriteCell : UITableViewCell
{
    UILabel *lblUserName;
    UILabel *lblStatus;
    UILabel *lblDate;
    UIImageView *imgProfilePic;
    UIImageView *imgRightShape;
}
@property(nonatomic,readonly) IBOutlet UILabel *lblUserName;

@property(nonatomic,readonly) IBOutlet UILabel *lblStatus;

@property(nonatomic,readonly) IBOutlet UILabel *lblDate;

@property(nonatomic,retain) IBOutlet  UIImageView *imgProfilePic;

@property(nonatomic,retain) IBOutlet  UIImageView *imgTriangle;

@property(nonatomic,retain) IBOutlet  UIImageView *imgRightShape;

@property(nonatomic,retain) IBOutlet UIImageView *imgBottomShape;

@end
